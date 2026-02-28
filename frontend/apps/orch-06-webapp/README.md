# orch-06-webapp frontend

## Local run
From repository root, start a static server and open the app page:

```bash
python3 -m http.server 8080
```

Then open:
- `http://localhost:8080/frontend/apps/orch-06-webapp/`

The app fetches:
- `/backend/apps/orch-06-webapp/api.json`
- `/frontend/apps/orch-06-webapp/specialist.txt`
