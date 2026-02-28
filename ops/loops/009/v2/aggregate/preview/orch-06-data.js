const d = {
  "api": {
    "project_id": "orch-06-webapp",
    "color": "pink",
    "accent": "#eb2f96",
    "background": "#fff0f6",
    "status": "active",
    "features": [
      "Live backend payload",
      "Specialist text sync",
      "QA smoke coverage"
    ]
  },
  "meta": {
    "owner": "orch-06",
    "loop": 9,
    "version": 1
  },
  "specialist": "Owner: orch-06.\nI track open issues daily and post accountability notes.\nFollow-up commitment: I will publish the next risk update by end of day.",
  "qa": {
    "status": "pass",
    "checks": [
      "backend/apps/orch-06-webapp/api.json exists and matches required schema",
      "backend/apps/orch-06-webapp/meta.json exists and matches required schema",
      "frontend/apps/orch-06-webapp/specialist.txt exists",
      "specialist text includes owner",
      "specialist text includes follow-up commitment",
      "frontend app references backend and specialist paths"
    ],
    "checked_files": [
      "backend/apps/orch-06-webapp/api.json",
      "backend/apps/orch-06-webapp/meta.json",
      "frontend/apps/orch-06-webapp/specialist.txt",
      "frontend/apps/orch-06-webapp/app.js",
      "tests/apps/orch-06-webapp/smoke.sh"
    ]
  }
}
;
