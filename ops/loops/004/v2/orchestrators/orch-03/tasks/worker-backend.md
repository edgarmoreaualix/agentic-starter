# Task | Loop 004 | orch-03 -> worker-backend

## Goal
- Produce tiny loop-004 placeholder artifacts for orchestration simulation.

## Scope
- backend/placeholders/orch-03/loop-004-service.json
- backend/placeholders/orch-03/loop-004-README.md
- ops/loops/004/v2/orchestrators/orch-03/summaries/worker-backend.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s backend/placeholders/orch-03/loop-004-service.json && test -s backend/placeholders/orch-03/loop-004-README.md && jq -e '.status=="done"' ops/loops/004/v2/orchestrators/orch-03/summaries/worker-backend.json

## Commit Guidance
- Commit 1: first file
- Commit 2: second file + summary
- Use typed messages.
