# AI Instructions Sync Script

This repository contains instruction files for various AI coding assistants (Claude Code, Cursor, GitHub Copilot, etc.). The `sync-global-configs.sh` script syncs these files to their corresponding global configuration directories on your system.

## What Gets Synced

### Root-Level Files

- `CLAUDE.md` → `~/.claude/CLAUDE.md` (Claude Code global config)
- `AGENTS.md` → `~/.cursor/AGENTS.md` (Cursor global config)

### Directory-Based Sync

Files are synced based on their root directory, preserving relative paths:

- `.claude/**/*.md` → `~/.claude/**/*.md`
  - Example: `.claude/skills/vercel-react-best-practices/AGENTS.md` → `~/.claude/skills/vercel-react-best-practices/AGENTS.md`
- `.cursor/**/*.md` → `~/.cursor/**/*.md`
  - Example: `.cursor/commands/deslop.md` → `~/.cursor/commands/deslop.md`
- `.github/**/*.md` → `~/.github/**/*.md`
- `.opencode/**/*.md` → `~/.opencode/**/*.md`

## Usage

### Basic Sync

Run the script to sync all files:

```bash
./sync-global-configs.sh
```

### Dry Run (Preview)

Preview what would be synced without making any changes:

```bash
./sync-global-configs.sh --dry-run
```

## Behavior

- **Copy-only**: The script only copies files. It does not delete files in the destination that no longer exist in the source.
- **Smart updates**: Files are only copied if they've changed (compared using `cmp`).
- **Directory creation**: Destination directories are created automatically if they don't exist.
- **Error handling**: The script exits on errors and provides clear error messages.

## Output

The script provides color-coded feedback:

- ℹ Blue: Informational messages (unchanged files, directory creation)
- ✓ Green: Success messages (files synced, directories created)
- ⚠ Yellow: Warning messages (files being updated)
- ✗ Red: Error messages

## Requirements

- macOS (or Unix-like system with bash)
- Standard Unix tools (`find`, `cmp`, `cp`, `mkdir`)

## Notes

- The script preserves the directory structure when syncing files from subdirectories.
- Only `.md` files are synced.
- Files are compared byte-by-byte before copying to avoid unnecessary writes.
