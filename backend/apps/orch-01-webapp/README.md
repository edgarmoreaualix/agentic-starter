# orch-01-webapp backend payload

This folder exposes static JSON payloads consumed by the frontend app.

## Files
- `api.json`: Runtime UI payload fetched by the browser from `/backend/apps/orch-01-webapp/api.json`.
- `meta.json`: Metadata for ownership and loop/version tracking.

## Frontend consumption contract
The frontend app in `frontend/apps/orch-01-webapp/app.js` fetches `api.json` and uses:
- `project_id` for title text
- `color`, `accent`, `background` for theme chips and visual tokens
- `status` and `features` for status card and feature list rendering

The app should treat `meta.json` as operational metadata.
