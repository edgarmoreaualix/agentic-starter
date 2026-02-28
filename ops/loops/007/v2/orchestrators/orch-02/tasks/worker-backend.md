# Task | Loop 007 | orch-02 -> worker-backend

## Goal
- Build tiny backend app data for orch-02 (blue).

## Scope
- backend/placeholders/orch-02/loop-007-app/config.json
- backend/placeholders/orch-02/loop-007-app/api.json
- ops/loops/007/v2/orchestrators/orch-02/summaries/worker-backend.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Keep app color-coded using: color=blue accent=#1677ff background=#f0f5ff (when relevant).
- Specialist worker must ensure page message is written in `frontend/placeholders/orch-02/loop-007-app/specialist-message.txt`.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s backend/placeholders/orch-02/loop-007-app/config.json && test -s backend/placeholders/orch-02/loop-007-app/api.json && jq -e '.status=="done"' ops/loops/007/v2/orchestrators/orch-02/summaries/worker-backend.json

## Commit Guidance
- Commit 1: first scoped file.
- Commit 2: second scoped file + summary JSON.
- Use typed messages.
