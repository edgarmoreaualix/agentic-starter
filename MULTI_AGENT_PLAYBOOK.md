# Multi-Agent Playbook

## Roles

### Orchestrator (this terminal)
- Define task specs and ownership boundaries
- Approve shared contract changes
- Review worker diffs and merge in controlled order
- Run integration checks after each merge

### Worker A (Backend)
- Owns `backend/` domain and API logic
- Can propose contract updates in `shared/`
- Does not modify `frontend/` directly

### Worker B (Frontend)
- Owns `frontend/` integration and UI
- Consumes contracts from `shared/`
- Does not modify `backend/` directly

### Worker C (UX/QA) (optional)
- Owns UX polish specs in `docs/`
- Validates flows and acceptance criteria
- Raises regressions with reproducible steps

## Rules

1. Parallelize by boundary, not by feature.
2. One owner per file during each loop window.
3. Shared contract changes require orchestrator approval.
4. Merge one worker branch at a time.
5. Run validation after every merge.

## Task Spec Template

- Goal:
- Scope (owned files/folders):
- Do not modify:
- Contract / inputs:
- Done criteria:
- Validation command:

## Starter Folder Ownership

- `backend/`: APIs, services, domain logic
- `frontend/`: UI and client orchestration
- `data/`: fixtures and seed/mock datasets
- `shared/`: contracts and shared types
- `docs/`: specs, QA checklists, architecture notes
- `ops/`: orchestration loops, prompts, summaries, merge plans

## Loop Workflow

1. Start loop skeleton: `./ops/bin/loop.sh start <n>`
2. Orchestrator writes prompts in `ops/loops/<NNN>/prompts/`
3. Workers execute and write summaries in `ops/loops/<NNN>/summaries/`
4. Assemble review input: `./ops/bin/loop.sh assemble <n>`
5. Orchestrator writes merge plan in `ops/loops/<NNN>/merges/merge-plan.md`
6. Execute merges manually with validation checks
