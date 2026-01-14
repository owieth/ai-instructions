# Project Guidelines

## Plan Mode

- Make the plan extremely concise. Sacrifice grammar for the sake of concision.
- At the end of each plan, give me a list of unresolved questions to answer, if any.

## Package Management

Before running any package manager commands, check the `packageManager` field in `package.json`.

Always lookup the latest version of an NPM package before installing:
```bash
npm view <package-name> versions
```

## Language

English only for all code, comments, docs, examples, commits, configs, errors, and tests.

## Git Commits

Use conventional commit format: `<type>(<scope>): <subject>`

**Types:** feat | fix | docs | style | refactor | test | chore | perf

**Rules:**
- Subject: 50 chars max, imperative mood ("add" not "added"), no period
- Small changes: one-line commit only
- Complex changes: add body explaining what/why (72-char lines), reference issues
- Keep commits atomic (one logical change) and self-explanatory
- Split into multiple commits if addressing different concerns

## Inclusive Terminology

Use: allowlist/blocklist, primary/replica, placeholder/example, main branch, conflict-free, concurrent/parallel

## Tools

- Use `rg` not `grep`
- Use `fd` not `find`
- `tree` is installed

## Style

Prefer self-documenting code over comments.

