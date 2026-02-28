# Bug watch

## Likely failure modes
- Static server started from wrong directory causes `/backend/...` and `/frontend/...` fetch 404s.
- Malformed `api.json` (missing fields or wrong types) breaks UI rendering expectations.
- Empty or missing `specialist.txt` leaves specialist block blank.
- Frontend assumes `features` is an array; non-array payload causes render mismatch.

## Quick checks
- Load app and verify title, chips, status, and features appear within first render.
- Open browser network panel and confirm both fetch calls return HTTP 200.
- Run `bash tests/apps/orch-01-webapp/smoke.sh` after payload changes.
- Validate backend payload with `jq` before deployment.
