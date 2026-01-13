---
**Current date**: 2026-01-13
---

Before running any package manager commands, check the `packageManager`field in the `package.json`.

Always lookup the latest version of an NPM package before installing with:
```
npm view <package-name> versions
```
- 
- **Language:** English only - all code, comments, docs, examples, commits, configs, errors, tests
**Git Commits**: Use conventional format: <type>(<scope>): <subject> where type = feat|fix|docs|style|refactor|test|chore|perf. Subject: 50 chars max, imperative mood ("add" not "added"), no period. For small changes: one-line commit only. For complex changes: add body explaining what/why (72-char lines) and reference issues. Keep commits atomic (one logical change) and self-explanatory. Split into multiple commits if addressing different concerns.
- **Inclusive Terms:** allowlist/blocklist, primary/replica, placeholder/example, main branch, conflict-free, concurrent/parallel
- **Tools**: Use rg not grep, fd not find, tree is installed
- **Style**: Prefer self-documenting code over comments
