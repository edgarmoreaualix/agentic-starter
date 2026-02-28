# Task | Loop 007 | orch-01 -> worker-backend

## Goal
- Build tiny backend app data for orch-01 (red).

## Scope
- backend/placeholders/orch-01/loop-007-app/config.json
- backend/placeholders/orch-01/loop-007-app/api.json
- ops/loops/007/v2/orchestrators/orch-01/summaries/worker-backend.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Keep app color-coded using: color=red accent=#ff4d4f background=#fff1f0 (when relevant).
- Specialist worker must ensure page message is written in `frontend/placeholders/orch-01/loop-007-app/specialist-message.txt`.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s backend/placeholders/orch-01/loop-007-app/config.json && test -s backend/placeholders/orch-01/loop-007-app/api.json && jq -e '.status=="done"' ops/loops/007/v2/orchestrators/orch-01/summaries/worker-backend.json

## Commit Guidance
- Commit 1: first scoped file.
- Commit 2: second scoped file + summary JSON.
- Use typed messages.
