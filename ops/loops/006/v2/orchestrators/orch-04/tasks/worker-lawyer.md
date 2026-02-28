# Task | Loop 006 | orch-04 -> worker-lawyer

## Goal
- Create tiny legal placeholder note + compliance checklist for loop 006.

## Scope
- docs/placeholders/orch-04/loop-006-legal-note.md
- docs/placeholders/orch-04/loop-006-compliance-check.md
- ops/loops/006/v2/orchestrators/orch-04/summaries/worker-lawyer.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s docs/placeholders/orch-04/loop-006-legal-note.md && test -s docs/placeholders/orch-04/loop-006-compliance-check.md && jq -e '.status=="done"' ops/loops/006/v2/orchestrators/orch-04/summaries/worker-lawyer.json

## Commit Guidance
- Commit 1: first file.
- Commit 2: second file + summary JSON.
- Use typed messages.
