#!/usr/bin/env bash
set -euo pipefail

# Sync script for global AI configs
# Syncs .md files from this repo to global config directories

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=false

# Parse arguments
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
fi

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print messages
info() {
  echo -e "${BLUE}ℹ${NC} $1"
}

success() {
  echo -e "${GREEN}✓${NC} $1"
}

warning() {
  echo -e "${YELLOW}⚠${NC} $1"
}

error() {
  echo -e "${RED}✗${NC} $1" >&2
}

# Function to sync a file
sync_file() {
  local source_file="$1"
  local dest_file="$2"
  local dest_dir="$(dirname "$dest_file")"

  # Create destination directory if it doesn't exist
  if [[ ! -d "$dest_dir" ]]; then
    if [[ "$DRY_RUN" == true ]]; then
      info "Would create directory: $dest_dir"
    else
      mkdir -p "$dest_dir"
      success "Created directory: $dest_dir"
    fi
  fi

  # Check if file exists and is different
  if [[ -f "$dest_file" ]]; then
    if cmp -s "$source_file" "$dest_file"; then
      if [[ "$DRY_RUN" == true ]]; then
        info "Would skip (unchanged): $dest_file"
      else
        info "Skipped (unchanged): $dest_file"
      fi
      return 0
    else
      if [[ "$DRY_RUN" == true ]]; then
        warning "Would update: $dest_file"
      else
        warning "Updating: $dest_file"
        cp "$source_file" "$dest_file"
        success "Synced: $dest_file"
      fi
      return 0
    fi
  else
    if [[ "$DRY_RUN" == true ]]; then
      info "Would create: $dest_file"
    else
      cp "$source_file" "$dest_file"
      success "Synced: $dest_file"
    fi
    return 0
  fi
}

# Main sync function
main() {
  cd "$SCRIPT_DIR"

  if [[ "$DRY_RUN" == true ]]; then
    info "DRY RUN MODE - No files will be modified"
    echo
  fi

  local synced_count=0
  local skipped_count=0

  # Sync root-level files
  if [[ -f "CLAUDE.md" ]]; then
    sync_file "CLAUDE.md" "$HOME/.claude/CLAUDE.md"
    if [[ "$DRY_RUN" == false ]]; then
      ((synced_count++))
    fi
  fi

  if [[ -f "AGENTS.md" ]]; then
    sync_file "AGENTS.md" "$HOME/.cursor/AGENTS.md"
    if [[ "$DRY_RUN" == false ]]; then
      ((synced_count++))
    fi
  fi

  # Sync files in recognized directories
  local dirs=(".claude" ".cursor" ".github" ".opencode")
  
  for dir in "${dirs[@]}"; do
    if [[ ! -d "$dir" ]]; then
      continue
    fi

    # Find all .md files in this directory
    while IFS= read -r -d '' file; do
      # Get relative path from the directory root
      local rel_path="${file#$dir/}"
      local dest_file="$HOME/$dir/$rel_path"
      
      sync_file "$file" "$dest_file"
      if [[ "$DRY_RUN" == false ]]; then
        ((synced_count++))
      fi
    done < <(find "$dir" -type f -name "*.md" -print0 2>/dev/null || true)
  done

  echo
  if [[ "$DRY_RUN" == true ]]; then
    success "Dry run complete. Use without --dry-run to apply changes."
  else
    success "Sync complete!"
  fi
}

# Run main function
main
