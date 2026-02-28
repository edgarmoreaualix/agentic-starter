# Task | Loop 007 | orch-01 -> worker-marketing

## Goal
- Write marketing message that appears on the page for orch-01.

## Scope
- frontend/placeholders/orch-01/loop-007-app/specialist-message.txt
- docs/placeholders/orch-01/loop-007-app/marketing-note.md
- ops/loops/007/v2/orchestrators/orch-01/summaries/worker-marketing.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Keep app color-coded using: color=red accent=#ff4d4f background=#fff1f0 (when relevant).
- Specialist worker must ensure page message is written in `frontend/placeholders/orch-01/loop-007-app/specialist-message.txt`.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s frontend/placeholders/orch-01/loop-007-app/specialist-message.txt && test -s docs/placeholders/orch-01/loop-007-app/marketing-note.md && jq -e '.status=="done"' ops/loops/007/v2/orchestrators/orch-01/summaries/worker-marketing.json

## Commit Guidance
- Commit 1: first scoped file.
- Commit 2: second scoped file + summary JSON.
- Use typed messages.
