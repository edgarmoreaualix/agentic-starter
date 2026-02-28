# orch-02-webapp backend payload

This folder provides JSON payloads consumed by the frontend app.

## Files
- `api.json`: UI-facing payload fetched by the frontend from `/backend/apps/orch-02-webapp/api.json`.
- `meta.json`: metadata (`owner`, `loop`, `version`) for traceability.

## Frontend contract
The frontend script reads `api.json` and renders:
- project title and color chips
- backend status and features list
- visual theme values (`blue`, `#1677ff`, `#f0f5ff`)
