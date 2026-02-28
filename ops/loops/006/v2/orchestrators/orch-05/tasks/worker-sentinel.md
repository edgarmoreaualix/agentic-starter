# Task | Loop 006 | orch-05 -> worker-sentinel

## Goal
- Create tiny sentinel hygiene artifacts for loop 006.

## Scope
- docs/placeholders/orch-05/loop-006-sentinel.md
- docs/placeholders/orch-05/loop-006-risk-log.md
- ops/loops/006/v2/orchestrators/orch-05/summaries/worker-sentinel.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s docs/placeholders/orch-05/loop-006-sentinel.md && test -s docs/placeholders/orch-05/loop-006-risk-log.md && jq -e '.status=="done"' ops/loops/006/v2/orchestrators/orch-05/summaries/worker-sentinel.json

## Commit Guidance
- Commit 1: first file.
- Commit 2: second file + summary JSON.
- Use typed messages.
