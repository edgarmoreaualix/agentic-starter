# Task | Loop 009 | orch-05 -> worker-frontend

## Goal
- Build a real simple web app for orch-05-webapp that renders backend data + specialist text.

## Scope
- frontend/apps/orch-05-webapp/index.html
- frontend/apps/orch-05-webapp/styles.css
- frontend/apps/orch-05-webapp/app.js
- frontend/apps/orch-05-webapp/README.md
- ops/loops/009/v2/orchestrators/orch-05/summaries/worker-frontend.json

## Do Not Modify
- backend/apps/
- frontend/apps/orch-05-webapp/specialist.txt (owned by specialist worker)
- tests/apps/
- docs/apps/

## Contract / Inputs
- Backend data path: `/backend/apps/orch-05-webapp/api.json`.
- Specialist text path: `/frontend/apps/orch-05-webapp/specialist.txt`.

## Done Criteria
- App loads data from both paths and renders:
  - title + color chips
  - backend status/features
  - specialist message block
- Uses project colors: color=teal, accent=#13c2c2, background=#e6fffb.
- README includes local run instructions with a static server.
- At least 2 commits.

## Validation Command
- test -s frontend/apps/orch-05-webapp/index.html && test -s frontend/apps/orch-05-webapp/styles.css && test -s frontend/apps/orch-05-webapp/app.js && rg -n "specialist|api.json|teal|#13c2c2|#e6fffb" frontend/apps/orch-05-webapp/*

## Commit Guidance
- Commit 1: HTML/CSS scaffold.
- Commit 2: JS data loading + README + summary.
