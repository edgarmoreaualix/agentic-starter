# Hardening: orch-02-webapp

- Add a small runtime schema guard in `app.js` before rendering backend fields.
- Render fallback chip labels when color tokens are missing or malformed.
- Add a short cache-busting strategy for `specialist.txt` during rapid copy updates.
- Add CI step to run `tests/apps/orch-02-webapp/smoke.sh` on every PR.
- Add manual accessibility check for contrast and keyboard focus in QA checklist.
