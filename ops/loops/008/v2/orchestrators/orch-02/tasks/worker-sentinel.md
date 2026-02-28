# Task | Loop 008 | orch-02 -> worker-sentinel

## Goal
- Upgrade sentinel bug watch and hardening guidance for loop-008.

## Scope
- docs/placeholders/orch-02/loop-008-app/bug-watch.md
- docs/placeholders/orch-02/loop-008-app/hardening.md
- ops/loops/008/v2/orchestrators/orch-02/summaries/worker-sentinel.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic loop-008 content.
- Keep color identity: color=blue accent=#1677ff background=#f0f5ff (when relevant).
- Specialist worker must ensure page message is written to `frontend/placeholders/orch-02/loop-008-app/specialist-message.txt`.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s docs/placeholders/orch-02/loop-008-app/bug-watch.md && test -s docs/placeholders/orch-02/loop-008-app/hardening.md && jq -e '.status=="done"' ops/loops/008/v2/orchestrators/orch-02/summaries/worker-sentinel.json

## Commit Guidance
- Commit 1: first scoped file.
- Commit 2: second scoped file + summary JSON.
- Use typed messages.
