# Task | Loop 005 | orch-01 -> worker-backend

## Goal
- Produce tiny loop-005 placeholder artifacts for orchestration simulation.

## Scope
- backend/placeholders/orch-01/loop-005-service.json
- backend/placeholders/orch-01/loop-005-README.md
- ops/loops/005/v2/orchestrators/orch-01/summaries/worker-backend.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s backend/placeholders/orch-01/loop-005-service.json && test -s backend/placeholders/orch-01/loop-005-README.md && jq -e '.status=="done"' ops/loops/005/v2/orchestrators/orch-01/summaries/worker-backend.json

## Commit Guidance
- Commit 1: first file
- Commit 2: second file + summary
- Use typed messages.
