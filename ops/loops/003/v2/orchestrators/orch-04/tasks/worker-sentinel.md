# Task | Loop 003 | orch-04 -> worker-sentinel

## Goal
- Create a minimal sentinel hygiene note for orch-04.

## Scope
- ops/loops/003/v2/orchestrators/orch-04/sentinel-note.md
- ops/loops/003/v2/orchestrators/orch-04/summaries/worker-sentinel.json

## Do Not Modify
- backend/
- frontend/
- shared/
- data/
- tests/
- Any path outside ops/loops/003/v2/orchestrators/orch-04/

## Done Criteria
- Create ops/loops/003/v2/orchestrators/orch-04/sentinel-note.md with 3 short lines: owner, status, next-step.
- Write summary JSON with status=done and all required fields.
- Keep the task tiny (orchestration-only; no product code changes).

## Validation Command
- test -s ops/loops/003/v2/orchestrators/orch-04/sentinel-note.md && jq -e '.status=="done" and (.files_changed|type=="array") and (.tests_run|type=="array") and (.risks|type=="array")' ops/loops/003/v2/orchestrators/orch-04/summaries/worker-sentinel.json

## Commit Guidance
- Prefer 1 small commit (2 max).
- Use typed message: chore.

## Worker Output Contract
Write JSON to:
`ops/loops/003/v2/orchestrators/orch-04/summaries/worker-sentinel.json`

Required fields:
- task_id (string)
- status (done|blocked|partial)
- files_changed (string[])
- tests_run (string[])
- commit_sha (string)
- summary (string)
- risks (string[])
