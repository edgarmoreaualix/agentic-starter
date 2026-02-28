# orch-04-webapp backend payload

This folder provides JSON payloads consumed by the frontend app:
- `/backend/apps/orch-04-webapp/api.json`: project display and status payload.
- `/backend/apps/orch-04-webapp/meta.json`: owner + loop metadata.

The frontend script fetches `api.json` at runtime and combines it with
`/frontend/apps/orch-04-webapp/specialist.txt` to render the full page.
