# Task | Loop 008 | orch-05 -> worker-backend

## Goal
- Upgrade backend app for orch-05 with versioned config and richer API payload.

## Scope
- backend/placeholders/orch-05/loop-008-app/config.json
- backend/placeholders/orch-05/loop-008-app/api.json
- ops/loops/008/v2/orchestrators/orch-05/summaries/worker-backend.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic loop-008 content.
- Keep color identity: color=teal accent=#13c2c2 background=#e6fffb (when relevant).
- Specialist worker must ensure page message is written to `frontend/placeholders/orch-05/loop-008-app/specialist-message.txt`.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s backend/placeholders/orch-05/loop-008-app/config.json && test -s backend/placeholders/orch-05/loop-008-app/api.json && jq -e '.status=="done"' ops/loops/008/v2/orchestrators/orch-05/summaries/worker-backend.json

## Commit Guidance
- Commit 1: first scoped file.
- Commit 2: second scoped file + summary JSON.
- Use typed messages.
