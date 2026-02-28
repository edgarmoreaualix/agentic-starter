# orch-03-webapp frontend

Simple static web app that renders:
- backend payload from `/backend/apps/orch-03-webapp/api.json`
- specialist text from `/frontend/apps/orch-03-webapp/specialist.txt`

## Local run
From repo root, start any static server. Example with Python:

```bash
python3 -m http.server 8080
```

Then open:
- `http://localhost:8080/frontend/apps/orch-03-webapp/`

Note: the frontend expects absolute fetch paths, so run from repo root.
