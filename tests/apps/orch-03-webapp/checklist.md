# QA Checklist | orch-03-webapp

- Verify the page loads at `frontend/apps/orch-03-webapp/` via a static server.
- Confirm title renders from backend `project_id`.
- Confirm color chips show `green`, `#52c41a`, and `#f6ffed`.
- Confirm status text and all features from backend `api.json` are visible.
- Confirm specialist message block displays exact text from `specialist.txt`.
- Confirm network requests for `/backend/apps/orch-03-webapp/api.json` and `/frontend/apps/orch-03-webapp/specialist.txt` return `200`.
