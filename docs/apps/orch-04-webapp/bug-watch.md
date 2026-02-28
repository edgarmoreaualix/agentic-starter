# Bug Watch

Likely failure modes and quick checks:

- Missing backend payload file: confirm `backend/apps/orch-04-webapp/api.json` exists and parses with `jq`.
- Missing specialist text: confirm `frontend/apps/orch-04-webapp/specialist.txt` is non-empty.
- Frontend fetch path mismatch: open browser network tab and verify both fetches return `200`.
- Payload schema drift: verify required keys (`project_id`, `color`, `accent`, `background`, `status`, `features`).
- Empty feature list: confirm `features` array length is greater than zero.
