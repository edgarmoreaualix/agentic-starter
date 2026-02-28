# Task | Loop 006 | orch-01 -> worker-frontend

## Goal
- Create tiny frontend placeholder artifacts for loop 006.

## Scope
- frontend/placeholders/orch-01/loop-006-theme.json
- frontend/placeholders/orch-01/loop-006-PREVIEW.md
- ops/loops/006/v2/orchestrators/orch-01/summaries/worker-frontend.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s frontend/placeholders/orch-01/loop-006-theme.json && test -s frontend/placeholders/orch-01/loop-006-PREVIEW.md && jq -e '.status=="done"' ops/loops/006/v2/orchestrators/orch-01/summaries/worker-frontend.json

## Commit Guidance
- Commit 1: first file.
- Commit 2: second file + summary JSON.
- Use typed messages.
