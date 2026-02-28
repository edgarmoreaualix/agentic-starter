# orch-03-webapp backend payload

This folder contains JSON payloads consumed by the frontend app at `frontend/apps/orch-03-webapp`.

## Files
- `api.json`: main app payload fetched by frontend from `/backend/apps/orch-03-webapp/api.json`.
- `meta.json`: lightweight metadata for ownership and loop/version tracking.

## Frontend contract
The frontend `app.js` fetches `api.json` and renders:
- project title
- color chips
- backend status
- feature list

The frontend also separately fetches the specialist text from `/frontend/apps/orch-03-webapp/specialist.txt`.
