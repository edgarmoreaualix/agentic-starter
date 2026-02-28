# Hardening Notes

Low-risk safeguards for next iteration:

- Add JSON schema validation in frontend before rendering payload values.
- Display explicit fallback UI when either fetch call fails.
- Pin allowed color/token format to prevent malformed UI values.
- Add smoke test in CI to run `tests/apps/orch-04-webapp/smoke.sh` on changes.
- Add content-length check for specialist text to catch accidental truncation.
