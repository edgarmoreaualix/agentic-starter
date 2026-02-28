# Bug watch

## Likely failure modes
- `api.json` returns missing keys (`status`, `features`) causing empty sections.
- `specialist.txt` is missing or empty, resulting in a blank accountability block.
- Frontend fetch path drift if app is served from a different root.
- Non-array `features` payload leads to incomplete list rendering.

## Quick checks
- Run `jq -e` schema checks on backend payload before release.
- Verify both fetch URLs return HTTP 200 in browser network panel.
- Confirm specialist block shows all lines from `specialist.txt`.
