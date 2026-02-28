# Task | Loop 008 | orch-05 -> worker-frontend

## Goal
- Upgrade frontend app schema and style for orch-05 with clearer sections.

## Scope
- frontend/placeholders/orch-05/loop-008-app/page.json
- frontend/placeholders/orch-05/loop-008-app/style.json
- ops/loops/008/v2/orchestrators/orch-05/summaries/worker-frontend.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic loop-008 content.
- Keep color identity: color=teal accent=#13c2c2 background=#e6fffb (when relevant).
- Specialist worker must ensure page message is written to `frontend/placeholders/orch-05/loop-008-app/specialist-message.txt`.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s frontend/placeholders/orch-05/loop-008-app/page.json && test -s frontend/placeholders/orch-05/loop-008-app/style.json && jq -e '.status=="done"' ops/loops/008/v2/orchestrators/orch-05/summaries/worker-frontend.json

## Commit Guidance
- Commit 1: first scoped file.
- Commit 2: second scoped file + summary JSON.
- Use typed messages.
