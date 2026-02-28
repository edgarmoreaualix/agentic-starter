# Task | Loop 009 | orch-02 -> worker-qa

## Goal
- Add real QA checks for orch-02-webapp web app integration.

## Scope
- tests/apps/orch-02-webapp/smoke.sh
- tests/apps/orch-02-webapp/checklist.md
- tests/apps/orch-02-webapp/result.json
- ops/loops/009/v2/orchestrators/orch-02/summaries/worker-qa.json

## Do Not Modify
- backend/apps/
- frontend/apps/
- docs/apps/

## Contract / Inputs
- Verify presence and schema of backend/frontend/specialist artifacts.

## Done Criteria
- `smoke.sh` checks required files and key fields/text.
- `result.json` captures pass/fail and checked file list.
- Checklist documents manual sanity points.
- At least 2 commits.

## Validation Command
- bash tests/apps/orch-02-webapp/smoke.sh && jq -e '.status=="pass" and (.checks|length>=5)' tests/apps/orch-02-webapp/result.json

## Commit Guidance
- Commit 1: checklist + smoke script.
- Commit 2: result.json + summary.
