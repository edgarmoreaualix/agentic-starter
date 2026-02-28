# Task | Loop 009 | orch-06 -> worker-frontend

## Goal
- Build a real simple web app for orch-06-webapp that renders backend data + specialist text.

## Scope
- frontend/apps/orch-06-webapp/index.html
- frontend/apps/orch-06-webapp/styles.css
- frontend/apps/orch-06-webapp/app.js
- frontend/apps/orch-06-webapp/README.md
- ops/loops/009/v2/orchestrators/orch-06/summaries/worker-frontend.json

## Do Not Modify
- backend/apps/
- frontend/apps/orch-06-webapp/specialist.txt (owned by specialist worker)
- tests/apps/
- docs/apps/

## Contract / Inputs
- Backend data path: `/backend/apps/orch-06-webapp/api.json`.
- Specialist text path: `/frontend/apps/orch-06-webapp/specialist.txt`.

## Done Criteria
- App loads data from both paths and renders:
  - title + color chips
  - backend status/features
  - specialist message block
- Uses project colors: color=pink, accent=#eb2f96, background=#fff0f6.
- README includes local run instructions with a static server.
- At least 2 commits.

## Validation Command
- test -s frontend/apps/orch-06-webapp/index.html && test -s frontend/apps/orch-06-webapp/styles.css && test -s frontend/apps/orch-06-webapp/app.js && rg -n "specialist|api.json|pink|#eb2f96|#fff0f6" frontend/apps/orch-06-webapp/*

## Commit Guidance
- Commit 1: HTML/CSS scaffold.
- Commit 2: JS data loading + README + summary.
