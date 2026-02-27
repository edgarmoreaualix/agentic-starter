# Framework

This folder defines the minimal multi-agent framework that should remain stable across projects.

## Operating Model

- One orchestrator
- N workers (configured in `ops/config/workers.env`)
- Strict ownership boundaries by file/domain
- File-based handoff for prompts, summaries, and merge plans

## Core Rules

1. Parallelize by boundary, not by feature.
2. One owner per file during a loop.
3. Contract changes require orchestrator approval.
4. Merge one worker branch at a time.
5. Run validation after each merge.

## Required Artifacts Per Loop

- `plan.md`
- `prompts/worker-*.md`
- `summaries/worker-*.md`
- `merge-review-input.md`
- `merges/merge-plan.md`
- `status.json`

## Customization

- Add project-specific personas in `ops/personas/`
- Add prompt templates in `ops/templates/`
- Keep script interfaces stable so habits transfer between projects
