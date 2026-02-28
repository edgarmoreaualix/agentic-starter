# orch-06-webapp backend payload

The frontend app consumes this backend payload from `/backend/apps/orch-06-webapp/api.json`.

## Contract
- `api.json` provides `project_id`, color tokens, `status`, and `features`.
- `meta.json` carries loop metadata (`owner`, `loop`, `version`).

## Frontend usage
- `frontend/apps/orch-06-webapp/app.js` fetches `api.json`.
- It maps color values into UI chips and renders `status` + `features`.
- Specialist copy is loaded separately from `/frontend/apps/orch-06-webapp/specialist.txt`.
