# Task | Loop 004 | orch-04 -> worker-frontend

## Goal
- Produce tiny loop-004 placeholder artifacts for orchestration simulation.

## Scope
- frontend/placeholders/orch-04/loop-004-theme.json
- frontend/placeholders/orch-04/loop-004-PREVIEW.md
- ops/loops/004/v2/orchestrators/orch-04/summaries/worker-frontend.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s frontend/placeholders/orch-04/loop-004-theme.json && test -s frontend/placeholders/orch-04/loop-004-PREVIEW.md && jq -e '.status=="done"' ops/loops/004/v2/orchestrators/orch-04/summaries/worker-frontend.json

## Commit Guidance
- Commit 1: first file
- Commit 2: second file + summary
- Use typed messages.
