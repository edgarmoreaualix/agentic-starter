# Task | Loop 009 | orch-06 -> worker-backend

## Goal
- Build real backend app payloads for orch-06-webapp to be consumed by a web page.

## Scope
- backend/apps/orch-06-webapp/api.json
- backend/apps/orch-06-webapp/meta.json
- backend/apps/orch-06-webapp/README.md
- ops/loops/009/v2/orchestrators/orch-06/summaries/worker-backend.json

## Do Not Modify
- frontend/apps/
- tests/apps/
- docs/apps/

## Contract / Inputs
- Frontend will fetch `/backend/apps/orch-06-webapp/api.json`.
- Specialist text is provided by specialty worker at `frontend/apps/orch-06-webapp/specialist.txt`.

## Done Criteria
- `api.json` includes: `project_id`, `color`, `accent`, `background`, `status`, `features`.
- `meta.json` includes: `owner`, `loop`, `version`.
- README explains how frontend consumes the backend payload.
- At least 2 commits.

## Validation Command
- jq -e '.project_id=="orch-06-webapp" and .color=="pink" and .accent=="#eb2f96" and .background=="#fff0f6" and .status=="active"' backend/apps/orch-06-webapp/api.json && jq -e '.loop==9 and .version==1' backend/apps/orch-06-webapp/meta.json

## Commit Guidance
- Commit 1: `api.json`.
- Commit 2: `meta.json` + README + summary.
