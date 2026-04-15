# Dotfiles

This repository stores personal shell, terminal, and Neovim configuration files.

## Structure

The layout mirrors `$HOME` so files can be linked into place:

- `nvim/.config/nvim/` — Neovim config based on [LazyVim](https://github.com/LazyVim/LazyVim)
  - `init.lua` bootstraps the local config
  - `lua/config/` contains core options, keymaps, autocommands, and Lazy setup
  - `lua/plugins/` contains plugin customizations
- `kitty/.config/kitty/` — Kitty terminal config
  - `kitty.conf` main terminal settings (font, cursor, performance, clipboard)
  - `themes/mocha.conf` Catppuccin Mocha theme
- `zsh/.zshrc` — Zsh environment setup and tool initialization

## Usage notes

1. Clone the repo:
   - `git clone https://github.com/gamee1910/dotfiles.git`
2. Create parent directories if needed:
   - `mkdir -p ~/.config ~/.config/kitty ~/.config/nvim`
3. Link files with [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html):
   - usage: `stow nvim && stow zsh && stow kitty`
4. Start Neovim once to install plugins:
   - `nvim`

### Requirements

- `zsh`
- `kitty`
- `nvim` (with LazyVim dependencies; see LazyVim documentation)
- Nerd Font (this config uses `JetBrainsMono Nerd Font` for Kitty)
