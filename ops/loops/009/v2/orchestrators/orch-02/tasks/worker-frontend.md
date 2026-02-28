# Task | Loop 009 | orch-02 -> worker-frontend

## Goal
- Build a real simple web app for orch-02-webapp that renders backend data + specialist text.

## Scope
- frontend/apps/orch-02-webapp/index.html
- frontend/apps/orch-02-webapp/styles.css
- frontend/apps/orch-02-webapp/app.js
- frontend/apps/orch-02-webapp/README.md
- ops/loops/009/v2/orchestrators/orch-02/summaries/worker-frontend.json

## Do Not Modify
- backend/apps/
- frontend/apps/orch-02-webapp/specialist.txt (owned by specialist worker)
- tests/apps/
- docs/apps/

## Contract / Inputs
- Backend data path: `/backend/apps/orch-02-webapp/api.json`.
- Specialist text path: `/frontend/apps/orch-02-webapp/specialist.txt`.

## Done Criteria
- App loads data from both paths and renders:
  - title + color chips
  - backend status/features
  - specialist message block
- Uses project colors: color=blue, accent=#1677ff, background=#f0f5ff.
- README includes local run instructions with a static server.
- At least 2 commits.

## Validation Command
- test -s frontend/apps/orch-02-webapp/index.html && test -s frontend/apps/orch-02-webapp/styles.css && test -s frontend/apps/orch-02-webapp/app.js && rg -n "specialist|api.json|blue|#1677ff|#f0f5ff" frontend/apps/orch-02-webapp/*

## Commit Guidance
- Commit 1: HTML/CSS scaffold.
- Commit 2: JS data loading + README + summary.
