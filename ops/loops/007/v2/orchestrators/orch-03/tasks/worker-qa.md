# Task | Loop 007 | orch-03 -> worker-qa

## Goal
- Test tiny frontend+backend app outputs for orch-03.

## Scope
- tests/placeholders/orch-03/loop-007-app/checklist.md
- tests/placeholders/orch-03/loop-007-app/result.json
- ops/loops/007/v2/orchestrators/orch-03/summaries/worker-qa.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Keep app color-coded using: color=green accent=#52c41a background=#f6ffed (when relevant).
- Specialist worker must ensure page message is written in `frontend/placeholders/orch-03/loop-007-app/specialist-message.txt`.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s tests/placeholders/orch-03/loop-007-app/checklist.md && test -s tests/placeholders/orch-03/loop-007-app/result.json && jq -e '.status=="done"' ops/loops/007/v2/orchestrators/orch-03/summaries/worker-qa.json

## Commit Guidance
- Commit 1: first scoped file.
- Commit 2: second scoped file + summary JSON.
- Use typed messages.
