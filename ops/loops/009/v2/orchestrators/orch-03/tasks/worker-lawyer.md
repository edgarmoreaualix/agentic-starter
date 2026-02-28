# Task | Loop 009 | orch-03 -> worker-lawyer

## Goal
- Write compliance-oriented specialist text rendered on-page.

## Scope
- frontend/apps/orch-03-webapp/specialist.txt
- docs/apps/orch-03-webapp/legal-note.md
- ops/loops/009/v2/orchestrators/orch-03/summaries/worker-lawyer.json

## Do Not Modify
- backend/apps/
- frontend/apps/orch-03-webapp/index.html
- frontend/apps/orch-03-webapp/styles.css
- frontend/apps/orch-03-webapp/app.js
- tests/apps/

## Contract / Inputs
- Frontend must render `frontend/apps/orch-03-webapp/specialist.txt` exactly as specialist message.

## Done Criteria
- specialist.txt contains 2-4 short lines aligned to role.
- Legal copy must include compliance scope and limitation sentence.
- note file explains rationale in <= 6 bullets.
- At least 2 commits.

## Validation Command
- test -s frontend/apps/orch-03-webapp/specialist.txt && test -s docs/apps/orch-03-webapp/legal-note.md && wc -l frontend/apps/orch-03-webapp/specialist.txt

## Commit Guidance
- Commit 1: specialist.txt.
- Commit 2: role note + summary.
