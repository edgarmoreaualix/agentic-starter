# orch-01-webapp frontend

Simple static frontend that renders backend payload data and specialist copy.

## Local run
From repository root, run a static server so root-relative fetch paths resolve correctly.

Using Python:

```bash
python3 -m http.server 4173
```

Then open `http://localhost:4173/frontend/apps/orch-01-webapp/`.

## Data sources
- Backend JSON: `/backend/apps/orch-01-webapp/api.json`
- Specialist text: `/frontend/apps/orch-01-webapp/specialist.txt`
