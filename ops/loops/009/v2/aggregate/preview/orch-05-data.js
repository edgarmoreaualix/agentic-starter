const d = {
  "api": {
    "project_id": "orch-05-webapp",
    "color": "teal",
    "accent": "#13c2c2",
    "background": "#e6fffb",
    "status": "active",
    "features": [
      "Backend payload fetch",
      "Specialist accountability message render",
      "Status and feature summary panel"
    ]
  },
  "meta": {
    "owner": "orch-05",
    "loop": 9,
    "version": 1
  },
  "specialist": "Owner: orch-05 accountability lead.\nI will post a follow-up verification update after every delivery.\nIf a check fails, I will log root cause and recovery ETA within one business day.",
  "qa": {
    "status": "pass",
    "checks": [
      "backend api.json exists and required schema keys are valid",
      "backend meta.json contains owner, loop=9, version=1",
      "frontend app.js fetches api.json and specialist.txt via contract paths",
      "specialist.txt is non-empty and contains owner + follow-up commitment",
      "index.html contains required render targets for title/status/features/specialist"
    ],
    "checked_files": null
  }
}
;
