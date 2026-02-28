# Task | Loop 009 | orch-06 -> worker-accountability

## Goal
- Write accountability-oriented specialist text rendered on-page.

## Scope
- frontend/apps/orch-06-webapp/specialist.txt
- docs/apps/orch-06-webapp/accountability-note.md
- ops/loops/009/v2/orchestrators/orch-06/summaries/worker-accountability.json

## Do Not Modify
- backend/apps/
- frontend/apps/orch-06-webapp/index.html
- frontend/apps/orch-06-webapp/styles.css
- frontend/apps/orch-06-webapp/app.js
- tests/apps/

## Contract / Inputs
- Frontend must render `frontend/apps/orch-06-webapp/specialist.txt` exactly as specialist message.

## Done Criteria
- specialist.txt contains 2-4 short lines aligned to role.
- Accountability copy must include owner + follow-up commitment.
- note file explains rationale in <= 6 bullets.
- At least 2 commits.

## Validation Command
- test -s frontend/apps/orch-06-webapp/specialist.txt && test -s docs/apps/orch-06-webapp/accountability-note.md && wc -l frontend/apps/orch-06-webapp/specialist.txt

## Commit Guidance
- Commit 1: specialist.txt.
- Commit 2: role note + summary.
