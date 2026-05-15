#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ZEN_PROFILES_INI="$HOME/Library/Application Support/zen/profiles.ini"

log() {
  printf '[dotfiles] %s\n' "$*"
}

install_homebrew() {
  if command -v brew >/dev/null 2>&1; then
    return 0
  fi

  log "Homebrew not found. Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
}

ensure_zen_profile() {
  if [[ -f "$ZEN_PROFILES_INI" ]]; then
    return 0
  fi

  log "Launching Zen once so it creates a profile"
  open -a "Zen"

  for _ in $(seq 1 60); do
    if [[ -f "$ZEN_PROFILES_INI" ]]; then
      break
    fi
    sleep 1
  done

  if [[ ! -f "$ZEN_PROFILES_INI" ]]; then
    log "Zen did not create a profile in time. Open Zen manually, then rerun ./scripts/bootstrap.sh"
    exit 1
  fi

  osascript -e 'tell application "Zen" to quit' >/dev/null 2>&1 || true
}

main() {
  install_homebrew

  log "Installing apps and tools from Brewfile"
  brew bundle --file "$REPO_ROOT/Brewfile"

  ensure_zen_profile

  log "Running bootstrap"
  "$REPO_ROOT/scripts/bootstrap.sh"
}

main
