#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
FLEET_CFG="${FLEET_CFG:-$ROOT_DIR/ops/config/fleet.env}"
FLEET_CFG_EXAMPLE="${FLEET_CFG_EXAMPLE:-$ROOT_DIR/ops/config/fleet.env.example}"
FLEET_TMUX_ENV="${FLEET_TMUX_ENV:-$ROOT_DIR/ops/runtime/fleet-tmux.env}"
TMUX_SOCKET_NAME="${TMUX_SOCKET_NAME:-fleet}"
TMUX_SOCKET_PATH="${TMUX_SOCKET_PATH:-}"

usage() {
  cat <<'USAGE'
Usage:
  ./ops/bin/orchestra-v2.sh init <loop_number>
  ./ops/bin/orchestra-v2.sh dispatch <loop_number>
  ./ops/bin/orchestra-v2.sh check <loop_number>
  ./ops/bin/orchestra-v2.sh assemble <loop_number>

Commands:
  init      Create v2 fleet skeleton under ops/loops/NNN/v2
  dispatch  Send loop dispatch instructions to each orchestrator tmux pane
  check     Show readiness for orchestrator tasks + worker summaries
  assemble  Validate worker JSON summaries and build aggregate artifacts
USAGE
}

trim_spaces() {
  local value="$1"
  value="${value#"${value%%[![:space:]]*}"}"
  value="${value%"${value##*[![:space:]]}"}"
  printf "%s" "$value"
}

split_csv() {
  local raw="$1"
  local item
  local out=()
  IFS=',' read -r -a parts <<<"$raw"
  for item in "${parts[@]}"; do
    item="$(trim_spaces "$item")"
    [[ -n "$item" ]] && out+=("$item")
  done
  printf "%s\n" "${out[@]}"
}

load_fleet_config() {
  local cfg_file="$FLEET_CFG"
  if [[ ! -f "$cfg_file" ]]; then
    cfg_file="$FLEET_CFG_EXAMPLE"
  fi

  # shellcheck disable=SC1090
  source "$cfg_file"

  ORCHESTRATORS=()
  while IFS= read -r line; do
    [[ -n "$line" ]] && ORCHESTRATORS+=("$line")
  done < <(split_csv "${FLEET_ORCHESTRATORS:-}")

  WORKERS=()
  while IFS= read -r line; do
    [[ -n "$line" ]] && WORKERS+=("$line")
  done < <(split_csv "${WORKER_ROLES:-}")

  REQUIRED_FIELDS=()
  while IFS= read -r line; do
    [[ -n "$line" ]] && REQUIRED_FIELDS+=("$line")
  done < <(split_csv "${SUMMARY_REQUIRED_FIELDS:-}")

  [[ ${#ORCHESTRATORS[@]} -gt 0 ]] || {
    echo "FLEET_ORCHESTRATORS is empty in $cfg_file" >&2
    exit 1
  }
  [[ ${#WORKERS[@]} -gt 0 ]] || {
    echo "WORKER_ROLES is empty in $cfg_file" >&2
    exit 1
  }
  [[ ${#REQUIRED_FIELDS[@]} -gt 0 ]] || {
    echo "SUMMARY_REQUIRED_FIELDS is empty in $cfg_file" >&2
    exit 1
  }

  ORCH_WORKER_MATRIX="${ORCH_WORKER_MATRIX:-}"
  TARGET_COMMITS_PER_WORKER="${TARGET_COMMITS_PER_WORKER:-3}"
}

workers_for_orchestrator() {
  local orch="$1"
  local matrix="${ORCH_WORKER_MATRIX:-}"
  local entry key raw

  if [[ -n "$matrix" ]]; then
    IFS=';' read -r -a entries <<<"$matrix"
    for entry in "${entries[@]}"; do
      entry="$(trim_spaces "$entry")"
      [[ -z "$entry" ]] && continue
      [[ "$entry" == *:* ]] || continue
      key="$(trim_spaces "${entry%%:*}")"
      raw="${entry#*:}"
      if [[ "$key" == "$orch" ]]; then
        split_csv "$raw"
        return 0
      fi
    done
  fi

  printf "%s\n" "${WORKERS[@]}"
}

expected_summary_count() {
  local orch line count
  count=0
  for orch in "${ORCHESTRATORS[@]}"; do
    while IFS= read -r line; do
      [[ -n "$line" ]] && ((count += 1))
    done < <(workers_for_orchestrator "$orch")
  done
  printf "%s" "$count"
}

pad_loop() {
  printf "%03d" "$1"
}

slug_to_env_var() {
  local slug="$1"
  local suffix
  suffix="$(echo "$slug" | tr '[:lower:]-' '[:upper:]_')"
  printf "TMUX_%s_PANE" "$suffix"
}

loop_dir() {
  local loop_num="$1"
  printf "%s/ops/loops/%s" "$ROOT_DIR" "$(pad_loop "$loop_num")"
}

v2_dir() {
  local loop_num="$1"
  printf "%s/v2" "$(loop_dir "$loop_num")"
}

file_state() {
  local path="$1"
  if [[ -s "$path" ]]; then
    echo "present"
  elif [[ -e "$path" ]]; then
    echo "empty"
  else
    echo "missing"
  fi
}

write_if_missing() {
  local path="$1"
  local content="$2"
  if [[ ! -e "$path" ]]; then
    printf "%s" "$content" >"$path"
  fi
}

create_task_stub() {
  local task_file="$1"
  local loop_pad="$2"
  local orch="$3"
  local worker="$4"

  write_if_missing "$task_file" "# Task | Loop ${loop_pad} | ${orch} -> ${worker}

## Goal
- Fill this before dispatch.

## Scope
- Fill exact file paths/folders.

## Do Not Modify
- Fill explicit exclusions.

## Done Criteria
- Fill observable outcomes.

## Validation Command
- Fill exact command(s).

## Commit Guidance
- Use small commits with typed messages: feat/fix/refactor/test/chore.
- Minimum 3 commits unless the task is intentionally tiny.

## Worker Output Contract
Write JSON to: \
\`ops/loops/${loop_pad}/v2/orchestrators/${orch}/summaries/${worker}.json\`

Required fields:
- task_id (string)
- status (done|blocked|partial)
- files_changed (string[])
- tests_run (string[])
- commit_sha (string)
- summary (string)
- risks (string[])
"
}

create_summary_stub() {
  local summary_file="$1"
  local loop_pad="$2"
  local orch="$3"
  local worker="$4"

  write_if_missing "$summary_file" "{
  \"task_id\": \"${loop_pad}-${orch}-${worker}\",
  \"status\": \"pending\",
  \"files_changed\": [],
  \"tests_run\": [],
  \"commit_sha\": \"\",
  \"summary\": \"\",
  \"risks\": []
}
"
}

ensure_loop_exists_or_create_base() {
  local loop_num="$1"
  local dir
  dir="$(loop_dir "$loop_num")"
  if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
  fi
}

load_fleet_tmux_env() {
  [[ -f "$FLEET_TMUX_ENV" ]] || {
    echo "Missing $FLEET_TMUX_ENV (copy from ops/runtime/fleet-tmux.env.example)" >&2
    exit 1
  }

  # shellcheck disable=SC1090
  source "$FLEET_TMUX_ENV"
  TMUX_SOCKET_NAME="${TMUX_SOCKET_NAME:-fleet}"
  TMUX_SOCKET_PATH="${TMUX_SOCKET_PATH:-}"
  if [[ -n "${TMUX_TMPDIR:-}" ]]; then
    export TMUX_TMPDIR
  fi
}

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Missing command: $1" >&2
    exit 1
  }
}

pane_for_orchestrator() {
  local orch="$1"
  local var
  var="$(slug_to_env_var "$orch")"
  local pane="${!var:-}"
  [[ -n "$pane" ]] || {
    echo "Missing pane mapping for $orch ($var) in ops/runtime/fleet-tmux.env" >&2
    return 1
  }
  printf "%s" "$pane"
}

tmux_send() {
  local pane="$1"
  local msg="$2"
  tmux "${TMUX_ARGS[@]}" send-keys -t "$pane" "$msg" Enter
}

init_tmux_args() {
  TMUX_ARGS=()
  if [[ -n "${TMUX_SOCKET_PATH:-}" ]]; then
    TMUX_ARGS=(-S "$TMUX_SOCKET_PATH")
  elif [[ -n "${TMUX_SOCKET_NAME:-}" ]]; then
    TMUX_ARGS=(-L "$TMUX_SOCKET_NAME")
  fi
}

tmux_ping() {
  tmux "${TMUX_ARGS[@]}" list-panes -a >/dev/null
}

task_file_is_ready() {
  local task_file="$1"
  [[ -s "$task_file" ]] || return 1
  # Reject untouched stubs.
  if rg -q "Fill this before dispatch\\.|Fill exact file paths/folders\\." "$task_file"; then
    return 1
  fi
  return 0
}

cmd_init() {
  local loop_num="$1"
  load_fleet_config
  ensure_loop_exists_or_create_base "$loop_num"

  local pad dir
  pad="$(pad_loop "$loop_num")"
  dir="$(v2_dir "$loop_num")"

  mkdir -p "$dir/orchestrators" "$dir/aggregate"

  local expected orch worker line
  expected="$(expected_summary_count)"
  for orch in "${ORCHESTRATORS[@]}"; do
    local orch_workers=()
    while IFS= read -r line; do
      [[ -n "$line" ]] && orch_workers+=("$line")
    done < <(workers_for_orchestrator "$orch")

    mkdir -p "$dir/orchestrators/$orch/tasks" "$dir/orchestrators/$orch/summaries"
    for worker in "${orch_workers[@]}"; do
      create_task_stub "$dir/orchestrators/$orch/tasks/$worker.md" "$pad" "$orch" "$worker"
      create_summary_stub "$dir/orchestrators/$orch/summaries/$worker.json" "$pad" "$orch" "$worker"
    done
  done

  write_if_missing "$dir/aggregate/dashboard.md" "# Loop ${pad} v2 Fleet Dashboard

- Status: initialized
- Orchestrators: ${#ORCHESTRATORS[@]}
- Workers per orchestrator: $( [[ -n "${ORCH_WORKER_MATRIX:-}" ]] && echo "custom" || echo "${#WORKERS[@]}" )
- Expected summaries: ${expected}
"

  {
    echo "{"
    echo "  \"loop\": $loop_num,"
    echo "  \"loop_padded\": \"$pad\","
    echo "  \"mode\": \"v2-fleet\","
    echo "  \"orchestrators\": ["
    local i
    for i in "${!ORCHESTRATORS[@]}"; do
      local comma=""
      [[ "$i" -lt $((${#ORCHESTRATORS[@]} - 1)) ]] && comma=","
      echo "    \"${ORCHESTRATORS[$i]}\"$comma"
    done
    echo "  ],"
    echo "  \"workers\": ["
    for i in "${!WORKERS[@]}"; do
      local comma=""
      [[ "$i" -lt $((${#WORKERS[@]} - 1)) ]] && comma=","
      echo "    \"${WORKERS[$i]}\"$comma"
    done
    echo "  ],"
    echo "  \"expected_summaries\": ${expected},"
    echo "  \"target_commits_per_worker\": $TARGET_COMMITS_PER_WORKER"
    echo "}"
  } >"$dir/status.json"

  echo "Initialized v2 fleet for loop ${pad}: ${dir#$ROOT_DIR/}"
}

cmd_dispatch() {
  local loop_num="$1"
  load_fleet_config
  load_fleet_tmux_env
  require_cmd tmux
  init_tmux_args
  tmux_ping || {
    if [[ -n "${TMUX_SOCKET_PATH:-}" ]]; then
      echo "Unable to access tmux socket path '$TMUX_SOCKET_PATH'." >&2
    elif [[ -n "${TMUX_SOCKET_NAME:-}" ]]; then
      echo "Unable to access tmux socket '$TMUX_SOCKET_NAME'." >&2
    else
      echo "Unable to access default tmux socket." >&2
    fi
    exit 1
  }

  local dir pad dispatch_log
  dir="$(v2_dir "$loop_num")"
  pad="$(pad_loop "$loop_num")"

  [[ -d "$dir" ]] || {
    echo "v2 loop directory not found: ${dir#$ROOT_DIR/}" >&2
    exit 1
  }

  mkdir -p "$dir/aggregate"
  dispatch_log="$dir/aggregate/dispatch-log.md"
  : >"$dispatch_log"

  {
    echo "# Loop ${pad} Dispatch Log"
    echo
    echo "- Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "- Dispatch source: control terminal"
    echo
  } >>"$dispatch_log"

  local orch worker pane line
  for orch in "${ORCHESTRATORS[@]}"; do
    local orch_workers=()
    while IFS= read -r line; do
      [[ -n "$line" ]] && orch_workers+=("$line")
    done < <(workers_for_orchestrator "$orch")

    local worker_list
    worker_list="$(IFS=', '; echo "${orch_workers[*]}")"
    pane="$(pane_for_orchestrator "$orch")"

    for worker in "${orch_workers[@]}"; do
      local task_file
      task_file="$dir/orchestrators/$orch/tasks/$worker.md"
      task_file_is_ready "$task_file" || {
        echo "Task not ready: ${task_file#$ROOT_DIR/}" >&2
        exit 1
      }
    done

    local msg
    msg="Loop ${pad} dispatch. Read your task files in \`ops/loops/${pad}/v2/orchestrators/${orch}/tasks/\` for workers [${worker_list}]. Dispatch each task to the matching worker session, enforce JSON output contract, and ensure summaries are written to \`ops/loops/${pad}/v2/orchestrators/${orch}/summaries/<worker>.json\`. Report blockers with status=blocked."
    tmux_send "$pane" "$msg"

    {
      echo "- Dispatched to \`${orch}\` on pane \`${pane}\`"
      echo "  - Tasks dir: \`ops/loops/${pad}/v2/orchestrators/${orch}/tasks/\`"
      echo "  - Summaries dir: \`ops/loops/${pad}/v2/orchestrators/${orch}/summaries/\`"
    } >>"$dispatch_log"
  done

  echo "Dispatched loop ${pad} to ${#ORCHESTRATORS[@]} orchestrators."
  echo "Log: ${dispatch_log#$ROOT_DIR/}"
}

is_valid_json_file() {
  local file="$1"
  if command -v jq >/dev/null 2>&1; then
    jq empty "$file" >/dev/null 2>&1
    return $?
  fi

  # fallback: minimal sanity check when jq is unavailable
  [[ -s "$file" ]] || return 1
  rg -q '"task_id"\s*:' "$file" || return 1
  rg -q '"status"\s*:' "$file" || return 1
  return 0
}

json_has_field() {
  local file="$1"
  local field="$2"
  if command -v jq >/dev/null 2>&1; then
    jq -e --arg k "$field" 'has($k)' "$file" >/dev/null 2>&1
    return $?
  fi
  rg -q "\"$field\"\\s*:" "$file"
}

summary_is_done() {
  local file="$1"
  if command -v jq >/dev/null 2>&1; then
    local status
    status="$(jq -r '.status // ""' "$file" 2>/dev/null || true)"
    [[ "$status" == "done" || "$status" == "partial" || "$status" == "blocked" ]]
    return $?
  fi
  rg -q '"status"\s*:\s*"(done|partial|blocked)"' "$file"
}

check_summary_file() {
  local file="$1"
  [[ -f "$file" ]] || return 1
  is_valid_json_file "$file" || return 1

  local field
  for field in "${REQUIRED_FIELDS[@]}"; do
    json_has_field "$file" "$field" || return 1
  done

  summary_is_done "$file" || return 1
  return 0
}

summary_status_value() {
  local file="$1"
  [[ -f "$file" ]] || {
    echo "missing"
    return 0
  }
  is_valid_json_file "$file" || {
    echo "invalid"
    return 0
  }

  local status=""
  if command -v jq >/dev/null 2>&1; then
    status="$(jq -r '.status // ""' "$file" 2>/dev/null || true)"
  else
    if rg -q '"status"\s*:\s*"done"' "$file"; then
      status="done"
    elif rg -q '"status"\s*:\s*"partial"' "$file"; then
      status="partial"
    elif rg -q '"status"\s*:\s*"blocked"' "$file"; then
      status="blocked"
    elif rg -q '"status"\s*:\s*"pending"' "$file"; then
      status="pending"
    fi
  fi

  case "$status" in
    done|partial|blocked|pending) echo "$status" ;;
    *) echo "unknown" ;;
  esac
}

cmd_check() {
  local loop_num="$1"
  load_fleet_config

  local dir
  dir="$(v2_dir "$loop_num")"
  [[ -d "$dir" ]] || {
    echo "v2 loop directory not found: ${dir#$ROOT_DIR/}" >&2
    exit 1
  }

  local expected total_tasks total_summaries valid_summaries line
  local status_done status_partial status_blocked status_pending status_invalid status_unknown
  expected="$(expected_summary_count)"
  total_tasks=0
  total_summaries=0
  valid_summaries=0
  status_done=0
  status_partial=0
  status_blocked=0
  status_pending=0
  status_invalid=0
  status_unknown=0

  local orch worker
  for orch in "${ORCHESTRATORS[@]}"; do
    local orch_workers=()
    while IFS= read -r line; do
      [[ -n "$line" ]] && orch_workers+=("$line")
    done < <(workers_for_orchestrator "$orch")

    echo "Orchestrator: $orch"
    for worker in "${orch_workers[@]}"; do
      local task_file summary_file task_state summary_state raw_status
      task_file="$dir/orchestrators/$orch/tasks/$worker.md"
      summary_file="$dir/orchestrators/$orch/summaries/$worker.json"

      task_state="$(file_state "$task_file")"
      summary_state="$(file_state "$summary_file")"
      raw_status="$(summary_status_value "$summary_file")"

      case "$raw_status" in
        done) ((status_done += 1)) ;;
        partial) ((status_partial += 1)) ;;
        blocked) ((status_blocked += 1)) ;;
        pending) ((status_pending += 1)) ;;
        invalid) ((status_invalid += 1)) ;;
        unknown) ((status_unknown += 1)) ;;
      esac

      [[ "$task_state" == "present" ]] && ((total_tasks += 1))
      if check_summary_file "$summary_file"; then
        summary_state="valid"
        ((valid_summaries += 1))
      fi
      [[ "$summary_state" != "missing" ]] && ((total_summaries += 1))

      printf "  %-22s task=%-8s summary=%-8s status=%s\n" "$worker" "$task_state" "$summary_state" "$raw_status"
    done
    echo
  done

  echo "Totals:"
  echo "- expected worker summaries: $expected"
  echo "- task files ready: $total_tasks/$expected"
  echo "- summary files present: $total_summaries/$expected"
  echo "- summary files valid: $valid_summaries/$expected"
  echo "- statuses: done=$status_done partial=$status_partial blocked=$status_blocked pending=$status_pending invalid=$status_invalid unknown=$status_unknown"
}

json_get() {
  local file="$1"
  local expr="$2"
  if command -v jq >/dev/null 2>&1; then
    jq -rc "$expr" "$file"
  else
    echo "[]"
  fi
}

cmd_assemble() {
  local loop_num="$1"
  load_fleet_config

  local dir aggregate_dir pad
  dir="$(v2_dir "$loop_num")"
  aggregate_dir="$dir/aggregate"
  pad="$(pad_loop "$loop_num")"

  [[ -d "$dir" ]] || {
    echo "v2 loop directory not found: ${dir#$ROOT_DIR/}" >&2
    exit 1
  }

  mkdir -p "$aggregate_dir"

  local summary_jsonl dashboard
  summary_jsonl="$aggregate_dir/worker-summaries.jsonl"
  dashboard="$aggregate_dir/dashboard.md"

  : >"$summary_jsonl"

  local expected valid done_count blocked_count partial_count line
  local raw_done raw_partial raw_blocked raw_pending raw_invalid raw_unknown
  expected="$(expected_summary_count)"
  valid=0
  done_count=0
  blocked_count=0
  partial_count=0
  raw_done=0
  raw_partial=0
  raw_blocked=0
  raw_pending=0
  raw_invalid=0
  raw_unknown=0

  local orch worker file
  for orch in "${ORCHESTRATORS[@]}"; do
    local orch_workers=()
    while IFS= read -r line; do
      [[ -n "$line" ]] && orch_workers+=("$line")
    done < <(workers_for_orchestrator "$orch")

    for worker in "${orch_workers[@]}"; do
      file="$dir/orchestrators/$orch/summaries/$worker.json"
      case "$(summary_status_value "$file")" in
        done) ((raw_done += 1)) ;;
        partial) ((raw_partial += 1)) ;;
        blocked) ((raw_blocked += 1)) ;;
        pending) ((raw_pending += 1)) ;;
        invalid|missing) ((raw_invalid += 1)) ;;
        *) ((raw_unknown += 1)) ;;
      esac

      if check_summary_file "$file"; then
        if command -v jq >/dev/null 2>&1; then
          jq -c --arg orch "$orch" --arg worker "$worker" '. + {orchestrator:$orch, worker:$worker}' "$file" >>"$summary_jsonl"
          case "$(jq -r '.status' "$file")" in
            done) ((done_count += 1)) ;;
            blocked) ((blocked_count += 1)) ;;
            partial) ((partial_count += 1)) ;;
          esac
        else
          cat "$file" >>"$summary_jsonl"
        fi
        ((valid += 1))
      fi
    done
  done

  {
    echo "# Loop ${pad} v2 Fleet Dashboard"
    echo
    echo "- Expected worker summaries: $expected"
    echo "- Valid summaries: $valid"
    echo "- Done: $done_count"
    echo "- Partial: $partial_count"
    echo "- Blocked: $blocked_count"
    echo "- Target commits per worker: $TARGET_COMMITS_PER_WORKER"
    echo
    echo "## Current Summary States"
    echo "- Done: $raw_done"
    echo "- Partial: $raw_partial"
    echo "- Blocked: $raw_blocked"
    echo "- Pending: $raw_pending"
    echo "- Invalid or Missing: $raw_invalid"
    echo "- Unknown: $raw_unknown"
    echo

    if command -v jq >/dev/null 2>&1 && [[ -s "$summary_jsonl" ]]; then
      echo "## Risk Highlights"
      jq -r 'select(.risks|type=="array" and length>0) | "- [" + .orchestrator + "/" + .worker + "] " + (.risks|join(" | "))' "$summary_jsonl"
      echo

      echo "## Commit SHAs"
      jq -r '"- [" + .orchestrator + "/" + .worker + "] " + (.commit_sha // "")' "$summary_jsonl"
      echo

      echo "## Changed Files Snapshot"
      jq -r '"- [" + .orchestrator + "/" + .worker + "] " + ((.files_changed // [])|join(", "))' "$summary_jsonl"
      echo
    else
      echo "jq not available or no valid summaries found."
      echo "Open JSONL file directly: \
\`ops/loops/${pad}/v2/aggregate/worker-summaries.jsonl\`"
      echo
    fi

    echo "## Orchestrator Action"
    echo "- Merge only done summaries with passing validation."
    echo "- Defer blocked/partial tasks to the next loop queue."
  } >"$dashboard"

  echo "Assembled v2 aggregate artifacts:"
  echo "- ${summary_jsonl#$ROOT_DIR/}"
  echo "- ${dashboard#$ROOT_DIR/}"
}

main() {
  if [[ $# -lt 2 ]]; then
    usage
    exit 1
  fi

  local cmd="$1"
  local loop_num="$2"

  case "$cmd" in
    init) cmd_init "$loop_num" ;;
    dispatch) cmd_dispatch "$loop_num" ;;
    check) cmd_check "$loop_num" ;;
    assemble) cmd_assemble "$loop_num" ;;
    *) usage; exit 1 ;;
  esac
}

main "$@"
