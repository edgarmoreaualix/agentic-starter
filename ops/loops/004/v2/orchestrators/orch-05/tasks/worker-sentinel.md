# Task | Loop 004 | orch-05 -> worker-sentinel

## Goal
- Produce tiny loop-004 placeholder artifacts for orchestration simulation.

## Scope
- docs/placeholders/orch-05/loop-004-sentinel.md
- docs/placeholders/orch-05/loop-004-risk-log.md
- ops/loops/004/v2/orchestrators/orch-05/summaries/worker-sentinel.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s docs/placeholders/orch-05/loop-004-sentinel.md && test -s docs/placeholders/orch-05/loop-004-risk-log.md && jq -e '.status=="done"' ops/loops/004/v2/orchestrators/orch-05/summaries/worker-sentinel.json

## Commit Guidance
- Commit 1: first file
- Commit 2: second file + summary
- Use typed messages.
