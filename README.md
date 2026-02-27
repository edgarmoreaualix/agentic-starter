# Agentic Starter

Reusable starter repo for new projects that need:

- a simple multi-agent framework (roles, boundaries, contracts)
- a file-based orchestration ops system
- optional supervised automation with `tmux`

## What You Get

- `framework/`: project-agnostic orchestration rules
- `ops/`: loop artifacts, scripts, templates, runtime config
- `Makefile`: common commands for daily operation

## Quickstart

1. Configure workers:

```bash
cp ops/config/workers.env.example ops/config/workers.env
```

2. (Optional) Configure tmux panes for automation:

```bash
cp ops/runtime/tmux.env.example ops/runtime/tmux.env
```

3. Start a loop:

```bash
make loop-start N=1
```

4. Inspect loop status:

```bash
make loop-check N=1
```

5. Assemble summaries for merge review:

```bash
make loop-assemble N=1
```

## Daily Workflow

1. `loop-start`: create loop skeleton and placeholder files
2. Orchestrator writes worker prompts in `ops/loops/<NNN>/prompts/`
3. Workers execute and write summaries in `ops/loops/<NNN>/summaries/`
4. `loop-assemble`: build merge review input
5. Orchestrator writes merge plan to `ops/loops/<NNN>/merges/merge-plan.md`
6. Human performs merges and validations

## Why This Stays Simple

- Everything is auditable as plain files
- No external services required
- Scripts are small and easy to modify
