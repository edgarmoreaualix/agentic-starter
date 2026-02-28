# Task | Loop 009 | orch-03 -> worker-sentinel

## Goal
- Add bug-watch and hardening notes for orch-03-webapp without changing product behavior.

## Scope
- docs/apps/orch-03-webapp/bug-watch.md
- docs/apps/orch-03-webapp/hardening.md
- ops/loops/009/v2/orchestrators/orch-03/summaries/worker-sentinel.json

## Do Not Modify
- backend/apps/
- frontend/apps/
- tests/apps/

## Done Criteria
- bug-watch lists likely failure modes and quick checks.
- hardening lists concrete low-risk safeguards for next iteration.
- At least 2 commits.

## Validation Command
- test -s docs/apps/orch-03-webapp/bug-watch.md && test -s docs/apps/orch-03-webapp/hardening.md

## Commit Guidance
- Commit 1: bug-watch.
- Commit 2: hardening + summary.
