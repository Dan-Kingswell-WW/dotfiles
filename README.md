# Dotfiles

This repo is the single source-controlled home for:

- Ghostty
- Neovim
- Hammerspoon
- Zen

The live config locations on your machine are symlinked back into this repo, so editing `~/.config/nvim` or `~/.config/ghostty` edits repo-tracked files directly.

## Workflow

1. Clone the repo.
2. Run `./scripts/bootstrap.sh`.
3. Edit your normal config paths.
4. Commit and push from this repo.

## Repo layout

- `configs/ghostty` -> `~/.config/ghostty`
- `configs/nvim` -> `~/.config/nvim`
- `configs/hammerspoon` -> `~/.hammerspoon`
- `configs/zen/profile/chrome` -> Zen `chrome` directory
- `configs/zen/profile/prefs.js` -> Zen `prefs.js`
- `configs/zen/profile/zen-keyboard-shortcuts.json` -> Zen keyboard shortcuts
- `configs/zen/profile/zen-themes.json` -> Zen themes config

## First-time setup on another Mac

1. Install Ghostty, Neovim, Zen, and Hammerspoon.
2. Open Zen once so it creates a profile.
3. Clone this repo.
4. Run `./scripts/bootstrap.sh`.
5. Restart the apps.

## Commands

```bash
./scripts/bootstrap.sh
```

## Notes

- `bootstrap` backs up anything it replaces into `~/.dotfiles-backups/`.
- Zen links into whichever profile is marked as the current default in `profiles.ini`.
- Zen still includes `prefs.js`, so some machine-specific browser state may come across.
- More detail lives in `SETUP.md`.
