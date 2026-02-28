# Hardening Notes | orch-03-webapp

- Add JSON schema validation for `api.json` before rendering.
- Add timeout handling and retry/backoff for fetch calls.
- Add a fallback specialist message for failed text loads.
- Enforce content-type checks (`application/json`, `text/plain`) before parsing.
- Add CI smoke execution to prevent contract regressions.
- Add CSP and basic security headers on static hosting.
