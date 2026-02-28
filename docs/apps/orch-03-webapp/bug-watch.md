# Bug Watch | orch-03-webapp

## Likely failure modes
- `api.json` missing required keys (`project_id`, color fields, `status`, `features`).
- `specialist.txt` path returns 404 due to incorrect static-server root.
- Frontend render errors if `features` is not an array.
- Broken color rendering when `accent` or `background` values are invalid hex.
- Silent fetch failures if network errors are not surfaced to the UI.

## Quick checks
- Run `bash tests/apps/orch-03-webapp/smoke.sh`.
- Open browser DevTools and confirm both fetch requests return `200`.
- Inspect UI for visible title, status, feature list, and specialist block.
