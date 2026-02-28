# Task | Loop 006 | orch-06 -> worker-qa

## Goal
- Create tiny QA validation artifacts for loop 006 placeholders.

## Scope
- tests/placeholders/orch-06/loop-006-checklist.md
- tests/placeholders/orch-06/loop-006-result.json
- ops/loops/006/v2/orchestrators/orch-06/summaries/worker-qa.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s tests/placeholders/orch-06/loop-006-checklist.md && test -s tests/placeholders/orch-06/loop-006-result.json && jq -e '.status=="done"' ops/loops/006/v2/orchestrators/orch-06/summaries/worker-qa.json

## Commit Guidance
- Commit 1: first file.
- Commit 2: second file + summary JSON.
- Use typed messages.
