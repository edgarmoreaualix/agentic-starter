# orch-02-webapp frontend

Simple static app that fetches backend payload and specialist copy.

## Run locally
From the repository root, start a static server, for example:

```bash
python3 -m http.server 8000
```

Open:
- `http://localhost:8000/frontend/apps/orch-02-webapp/`

The app fetches:
- `/backend/apps/orch-02-webapp/api.json`
- `/frontend/apps/orch-02-webapp/specialist.txt`
