# Task | Loop 009 | orch-05 -> worker-backend

## Goal
- Build real backend app payloads for orch-05-webapp to be consumed by a web page.

## Scope
- backend/apps/orch-05-webapp/api.json
- backend/apps/orch-05-webapp/meta.json
- backend/apps/orch-05-webapp/README.md
- ops/loops/009/v2/orchestrators/orch-05/summaries/worker-backend.json

## Do Not Modify
- frontend/apps/
- tests/apps/
- docs/apps/

## Contract / Inputs
- Frontend will fetch `/backend/apps/orch-05-webapp/api.json`.
- Specialist text is provided by specialty worker at `frontend/apps/orch-05-webapp/specialist.txt`.

## Done Criteria
- `api.json` includes: `project_id`, `color`, `accent`, `background`, `status`, `features`.
- `meta.json` includes: `owner`, `loop`, `version`.
- README explains how frontend consumes the backend payload.
- At least 2 commits.

## Validation Command
- jq -e '.project_id=="orch-05-webapp" and .color=="teal" and .accent=="#13c2c2" and .background=="#e6fffb" and .status=="active"' backend/apps/orch-05-webapp/api.json && jq -e '.loop==9 and .version==1' backend/apps/orch-05-webapp/meta.json

## Commit Guidance
- Commit 1: `api.json`.
- Commit 2: `meta.json` + README + summary.
