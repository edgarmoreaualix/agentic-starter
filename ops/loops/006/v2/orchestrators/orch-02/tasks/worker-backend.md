# Task | Loop 006 | orch-02 -> worker-backend

## Goal
- Create tiny backend placeholder artifacts for loop 006.

## Scope
- backend/placeholders/orch-02/loop-006-service.json
- backend/placeholders/orch-02/loop-006-README.md
- ops/loops/006/v2/orchestrators/orch-02/summaries/worker-backend.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s backend/placeholders/orch-02/loop-006-service.json && test -s backend/placeholders/orch-02/loop-006-README.md && jq -e '.status=="done"' ops/loops/006/v2/orchestrators/orch-02/summaries/worker-backend.json

## Commit Guidance
- Commit 1: first file.
- Commit 2: second file + summary JSON.
- Use typed messages.
