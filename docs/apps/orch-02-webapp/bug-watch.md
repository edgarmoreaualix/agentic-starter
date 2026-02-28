# Bug watch: orch-02-webapp

## Likely failure modes
- Static server started from wrong directory breaks absolute fetch paths.
- `api.json` shape drift (missing `features` array) causes empty rendering.
- CSS token changes can reduce contrast on color chips.
- `specialist.txt` missing/empty leaves message block blank.

## Quick checks
- Open devtools network tab and verify both fetches return HTTP 200.
- Validate backend payload with `jq` before release.
- Run `bash tests/apps/orch-02-webapp/smoke.sh` after content edits.
