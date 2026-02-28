# Task | Loop 004 | orch-03 -> worker-qa

## Goal
- Produce tiny loop-004 placeholder artifacts for orchestration simulation.

## Scope
- tests/placeholders/orch-03/loop-004-checklist.md
- tests/placeholders/orch-03/loop-004-result.json
- ops/loops/004/v2/orchestrators/orch-03/summaries/worker-qa.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s tests/placeholders/orch-03/loop-004-checklist.md && test -s tests/placeholders/orch-03/loop-004-result.json && jq -e '.status=="done"' ops/loops/004/v2/orchestrators/orch-03/summaries/worker-qa.json

## Commit Guidance
- Commit 1: first file
- Commit 2: second file + summary
- Use typed messages.
