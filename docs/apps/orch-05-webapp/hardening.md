# Hardening plan

- Add JSON schema validation in CI for `backend/apps/orch-05-webapp/api.json`.
- Add a frontend guard: if `features` is not an array, render a fallback message.
- Add smoke test step to fail on empty specialist content.
- Add explicit timeout handling for fetches with user-visible retry guidance.
- Pin a minimal static serving command in docs to reduce path mismatch issues.
