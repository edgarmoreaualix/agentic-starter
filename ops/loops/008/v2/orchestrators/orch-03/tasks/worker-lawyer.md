# Task | Loop 008 | orch-03 -> worker-lawyer

## Goal
- Upgrade legal page message and note with explicit compliance scope.

## Scope
- frontend/placeholders/orch-03/loop-008-app/specialist-message.txt
- docs/placeholders/orch-03/loop-008-app/legal-note.md
- ops/loops/008/v2/orchestrators/orch-03/summaries/worker-lawyer.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic loop-008 content.
- Keep color identity: color=green accent=#52c41a background=#f6ffed (when relevant).
- Specialist worker must ensure page message is written to `frontend/placeholders/orch-03/loop-008-app/specialist-message.txt`.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s frontend/placeholders/orch-03/loop-008-app/specialist-message.txt && test -s docs/placeholders/orch-03/loop-008-app/legal-note.md && jq -e '.status=="done"' ops/loops/008/v2/orchestrators/orch-03/summaries/worker-lawyer.json

## Commit Guidance
- Commit 1: first scoped file.
- Commit 2: second scoped file + summary JSON.
- Use typed messages.
