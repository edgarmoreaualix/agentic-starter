# Bug watch

## Likely failure modes
- API fetch path mismatch (`/backend/...`) returns 404.
- `features` arrives as non-array and breaks list rendering.
- Specialist text missing causes empty accountability block.
- Color tokens missing causes chip labels to render `undefined`.

## Quick checks
- Open browser devtools and inspect network responses for both fetches.
- Run `bash tests/apps/orch-06-webapp/smoke.sh`.
- Validate JSON with `jq` before deploy.
