# Task | Loop 006 | orch-02 -> worker-marketing

## Goal
- Create tiny marketing placeholder brief + copy for loop 006.

## Scope
- docs/placeholders/orch-02/loop-006-marketing-brief.md
- docs/placeholders/orch-02/loop-006-marketing-copy.md
- ops/loops/006/v2/orchestrators/orch-02/summaries/worker-marketing.json

## Do Not Modify
- Any product code outside these placeholder paths.

## Done Criteria
- Create both scoped files with deterministic content.
- Write summary JSON with status=done and all required fields.
- Make at least 2 worker commits before merge.

## Validation Command
- test -s docs/placeholders/orch-02/loop-006-marketing-brief.md && test -s docs/placeholders/orch-02/loop-006-marketing-copy.md && jq -e '.status=="done"' ops/loops/006/v2/orchestrators/orch-02/summaries/worker-marketing.json

## Commit Guidance
- Commit 1: first file.
- Commit 2: second file + summary JSON.
- Use typed messages.
