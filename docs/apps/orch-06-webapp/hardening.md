# Hardening notes

- Add JSON schema validation in frontend before rendering optional fields.
- Add retry with backoff for both fetch calls to reduce transient failures.
- Add timeout guards around network requests.
- Add CI job that runs `tests/apps/orch-06-webapp/smoke.sh` on each change.
- Log structured frontend errors with failing path and HTTP status.
