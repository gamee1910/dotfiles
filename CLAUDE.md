# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles managed with GNU Stow. Each top-level directory is a Stow package whose contents mirror `$HOME`
(e.g. `kitty/.config/kitty/kitty.conf` → `~/.config/kitty/kitty.conf`). There is no build, lint, or test suite.

Packages: `nvim`, `kitty`, `zsh`, `fastfetch`, `plasma`, `fcitx5`.

## Commands

- Link a package into `$HOME` (run from repo root): `stow <package>` — e.g. `stow nvim kitty zsh fastfetch plasma fcitx5`
- Preview without changing anything: `stow -nv <package>`
- Unlink: `stow -D <package>`
- Format Neovim Lua (uses `nvim/.config/nvim/stylua.toml`, 2-space indent, 120 cols): `stylua nvim/.config/nvim`
- Check that Neovim config loads: `nvim --headless "+Lazy! sync" +qa` (installs/updates plugins and `lazy-lock.json`)

When adding a new file, place it at its `$HOME`-relative path inside the right package (or a new package dir) so Stow
can link it. Since packages are symlinked, edits here take effect live on the machine.

## Neovim (`nvim/.config/nvim/`)

LazyVim-based. `init.lua` → `lua/config/lazy.lua`, which bootstraps lazy.nvim and loads, in order: LazyVim core,
LazyVim extras (`lang.clangd`, `lang.java`), then everything in `lua/plugins/`. Files in `lua/plugins/` return lazy.nvim
specs that *extend/override* LazyVim defaults (opts are merged), so check LazyVim's defaults before assuming a plugin
isn't configured. LazyVim auto-loads `lua/config/{options,keymaps,autocmds}.lua`.

- `plugins/lsp.lua` is the language-tooling hub: Mason `ensure_installed`, lspconfig server settings (clangd, gopls),
  and conform.nvim `formatters_by_ft` (stylua, shfmt, google-java-format, clang-format, goimports/gofmt). Adding a
  language usually means touching all three sections here (or importing a LazyVim `lang.*` extra in `lazy.lua`).
- `plugins/colorscheme.lua`: `onedark` (style `darker`) is the default; `<leader>qp` cycles through the listed schemes.
- `plugins/toggleterm.lua` has Maven terminals (`<leader>st` → `./mvnw test`, `<leader>sc` → `./mvnw clean install`).
- `config/autocmds.lua` also runs `vim.lsp.buf.format` on `BufWritePre`, in addition to LazyVim's own autoformat.
- Some keymap descriptions are written in Vietnamese (`plugins/telescope.lua`).

## Kitty (`kitty/.config/kitty/`)

The theme lives in `current-theme.conf`, included from the `BEGIN_KITTY_THEME`/`END_KITTY_THEME` block that
`kitty +kitten themes` rewrites — change themes with that kitten rather than editing the block by hand.
`kitty.conf.bak` is an older copy. (The README's `themes/mocha.conf` no longer exists; that include is commented out.)

Vietnamese input: kitty only speaks the ibus protocol, so fcitx5 is used via its ibus frontend. `GLFW_IM_MODULE=ibus`
must be set before kitty starts, which `plasma/.config/plasma-workspace/env/kitty-ime.sh` does at KDE Plasma login
(needs `stow plasma` and a re-login).

The fcitx5 config itself (Unikey/Telex, hotkeys) is the `fcitx5` package. Stow links the whole
`~/.config/fcitx5` directory, not each file, because fcitx5 saves by replacing files, which would break per-file
symlinks. Its runtime files (`conf/cached_layouts`, `crash.log`) are gitignored. Unlink it with `stow -D fcitx5`.

## Zsh (`zsh/.zshrc`)

Uses zinit (self-installs to `~/.local/share/zinit`) with Powerlevel10k and OMZ snippets. Expects these tools on PATH
since they're `eval`'d unconditionally: `fzf`, `zoxide` (replaces `cd`), `direnv`, `go`. Also adds `/opt/nvim/bin`,
`~/.local/bin`, Go bins, and SDKMAN. `~/.p10k.zsh` is sourced if present but is not tracked here.
