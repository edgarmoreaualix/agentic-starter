# Hardening plan (next iteration)

- Add JSON schema validation in frontend before rendering backend payload.
- Add default fallback values when `features` is missing or invalid.
- Add explicit timeout and retry logic around both `fetch` calls.
- Add CI job to run `tests/apps/orch-01-webapp/smoke.sh` on every PR.
- Serve `specialist.txt` with content checks to prevent accidental empty releases.
