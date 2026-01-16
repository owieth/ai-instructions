# Project Instructions

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

## UI Development

When working on UI components and interfaces, apply these opinionated constraints for building better interfaces.

### Stack

- MUST use Tailwind CSS defaults unless custom values already exist or are explicitly requested
- MUST use `motion/react` (formerly `framer-motion`) when JavaScript animation is required
- SHOULD use `tw-animate-css` for entrance and micro-animations in Tailwind CSS
- MUST use `cn` utility (`clsx` + `tailwind-merge`) for class logic

### Components

- MUST use accessible component primitives for anything with keyboard or focus behavior (`Base UI`, `React Aria`, `Radix`)
- MUST use the project's existing component primitives first
- NEVER mix primitive systems within the same interaction surface
- SHOULD prefer [`Base UI`](https://base-ui.com/react/components) for new primitives if compatible with the stack
- MUST add an `aria-label` to icon-only buttons
- NEVER rebuild keyboard or focus behavior by hand unless explicitly requested

### Interaction

- MUST use an `AlertDialog` for destructive or irreversible actions
- SHOULD use structural skeletons for loading states
- NEVER use `h-screen`, use `h-dvh`
- MUST respect `safe-area-inset` for fixed elements
- MUST show errors next to where the action happens
- NEVER block paste in `input` or `textarea` elements

### Animation

- NEVER add animation unless it is explicitly requested
- MUST animate only compositor props (`transform`, `opacity`)
- NEVER animate layout properties (`width`, `height`, `top`, `left`, `margin`, `padding`)
- SHOULD avoid animating paint properties (`background`, `color`) except for small, local UI (text, icons)
- SHOULD use `ease-out` on entrance
- NEVER exceed `200ms` for interaction feedback
- MUST pause looping animations when off-screen
- SHOULD respect `prefers-reduced-motion`
- NEVER introduce custom easing curves unless explicitly requested
- SHOULD avoid animating large images or full-screen surfaces

### Typography

- MUST use `text-balance` for headings and `text-pretty` for body/paragraphs
- MUST use `tabular-nums` for data
- SHOULD use `truncate` or `line-clamp` for dense UI
- NEVER modify `letter-spacing` (`tracking-*`) unless explicitly requested

### Layout

- MUST use a fixed `z-index` scale (no arbitrary `z-*`)
- SHOULD use `size-*` for square elements instead of `w-*` + `h-*`

### Performance

- NEVER animate large `blur()` or `backdrop-filter` surfaces
- NEVER apply `will-change` outside an active animation
- NEVER use `useEffect` for anything that can be expressed as render logic

### Design

- NEVER use gradients unless explicitly requested
- NEVER use purple or multicolor gradients
- NEVER use glow effects as primary affordances
- SHOULD use Tailwind CSS default shadow scale unless explicitly requested
- MUST give empty states one clear next action
- SHOULD limit accent color usage to one per view
- SHOULD use existing theme or Tailwind CSS color tokens before introducing new ones
