# orch-05-webapp frontend

This app fetches:

- backend payload from `/backend/apps/orch-05-webapp/api.json`
- specialist copy from `/frontend/apps/orch-05-webapp/specialist.txt`

## Local run

From repo root, start a static server so absolute paths resolve:

```bash
python3 -m http.server 4173
```

Open: `http://localhost:4173/frontend/apps/orch-05-webapp/`
