#!/usr/bin/env bash
set -euo pipefail

fail=0

check() {
  local name="$1"
  local cmd="$2"
  if eval "$cmd"; then
    echo "PASS: $name"
  else
    echo "FAIL: $name"
    fail=1
  fi
}

check "backend api exists" "test -s backend/apps/orch-06-webapp/api.json"
check "backend meta exists" "test -s backend/apps/orch-06-webapp/meta.json"
check "frontend specialist exists" "test -s frontend/apps/orch-06-webapp/specialist.txt"
check "api required keys" "jq -e '.project_id==\"orch-06-webapp\" and .color==\"pink\" and .accent==\"#eb2f96\" and .background==\"#fff0f6\" and .status==\"active\" and (.features|type)==\"array\"' backend/apps/orch-06-webapp/api.json >/dev/null"
check "meta required keys" "jq -e '.owner==\"orch-06\" and .loop==9 and .version==1' backend/apps/orch-06-webapp/meta.json >/dev/null"
check "specialist has owner" "rg -n 'Owner:' frontend/apps/orch-06-webapp/specialist.txt >/dev/null"
check "specialist has follow-up commitment" "rg -n 'Follow-up commitment:' frontend/apps/orch-06-webapp/specialist.txt >/dev/null"

if [ "$fail" -ne 0 ]; then
  exit 1
fi
