# Task | Loop 008 | orch-06 -> worker-sentinel

## Goal
- Upgrade sentinel bug watch and hardening guidance for loop-008.

## Scope
- docs/placeholders/orch-06/loop-008-app/bug-watch.md
- docs/placeholders/orch-06/loop-008-app/hardening.md
- ops/loops/008/v2/orchestrators/orch-06/summaries/worker-sentinel.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic loop-008 content.
- Keep color identity: color=pink accent=#eb2f96 background=#fff0f6 (when relevant).
- Specialist worker must ensure page message is written to `frontend/placeholders/orch-06/loop-008-app/specialist-message.txt`.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s docs/placeholders/orch-06/loop-008-app/bug-watch.md && test -s docs/placeholders/orch-06/loop-008-app/hardening.md && jq -e '.status=="done"' ops/loops/008/v2/orchestrators/orch-06/summaries/worker-sentinel.json

## Commit Guidance
- Commit 1: first scoped file.
- Commit 2: second scoped file + summary JSON.
- Use typed messages.
