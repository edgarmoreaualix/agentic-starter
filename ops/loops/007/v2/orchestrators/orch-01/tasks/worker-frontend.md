# Task | Loop 007 | orch-01 -> worker-frontend

## Goal
- Build tiny frontend page shell for orch-01 using color red.

## Scope
- frontend/placeholders/orch-01/loop-007-app/page.json
- frontend/placeholders/orch-01/loop-007-app/style.json
- ops/loops/007/v2/orchestrators/orch-01/summaries/worker-frontend.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Keep app color-coded using: color=red accent=#ff4d4f background=#fff1f0 (when relevant).
- Specialist worker must ensure page message is written in `frontend/placeholders/orch-01/loop-007-app/specialist-message.txt`.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s frontend/placeholders/orch-01/loop-007-app/page.json && test -s frontend/placeholders/orch-01/loop-007-app/style.json && jq -e '.status=="done"' ops/loops/007/v2/orchestrators/orch-01/summaries/worker-frontend.json

## Commit Guidance
- Commit 1: first scoped file.
- Commit 2: second scoped file + summary JSON.
- Use typed messages.
