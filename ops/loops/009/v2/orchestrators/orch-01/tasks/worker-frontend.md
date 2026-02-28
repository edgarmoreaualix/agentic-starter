# Task | Loop 009 | orch-01 -> worker-frontend

## Goal
- Build a real simple web app for orch-01-webapp that renders backend data + specialist text.

## Scope
- frontend/apps/orch-01-webapp/index.html
- frontend/apps/orch-01-webapp/styles.css
- frontend/apps/orch-01-webapp/app.js
- frontend/apps/orch-01-webapp/README.md
- ops/loops/009/v2/orchestrators/orch-01/summaries/worker-frontend.json

## Do Not Modify
- backend/apps/
- frontend/apps/orch-01-webapp/specialist.txt (owned by specialist worker)
- tests/apps/
- docs/apps/

## Contract / Inputs
- Backend data path: `/backend/apps/orch-01-webapp/api.json`.
- Specialist text path: `/frontend/apps/orch-01-webapp/specialist.txt`.

## Done Criteria
- App loads data from both paths and renders:
  - title + color chips
  - backend status/features
  - specialist message block
- Uses project colors: color=red, accent=#ff4d4f, background=#fff1f0.
- README includes local run instructions with a static server.
- At least 2 commits.

## Validation Command
- test -s frontend/apps/orch-01-webapp/index.html && test -s frontend/apps/orch-01-webapp/styles.css && test -s frontend/apps/orch-01-webapp/app.js && rg -n "specialist|api.json|red|#ff4d4f|#fff1f0" frontend/apps/orch-01-webapp/*

## Commit Guidance
- Commit 1: HTML/CSS scaffold.
- Commit 2: JS data loading + README + summary.
