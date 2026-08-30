# Agent Context & Workspace Rules (Dotfiles & Systems)

## 1. Environment & Core Stack
- **OS**: macOS (Apple Silicon / Mac mini M4)
- **Shell**: Fish Shell (Managed via `fisher` manifest `fish_plugins`)
- **Terminal**: Ghostty
- **Primary Editor**: Neovim (`~/.config/nvim`, configured with `Lazy.nvim`)
- **Tech Stack**: Go, TypeScript, Node.js, NestJS, React, Docker, PostgreSQL
- **Architecture Philosophy**: Prefer clean, official community-standard configurations over custom/hacky workarounds.

---

## 2. Neovim & Plugin Architecture Rules
- **Plugin Manager**: `lazy.nvim` structured under `lua/sherrinford/plugins/*.lua`.
- **Treesitter (`treesitter.lua`)**:
  - Must pin `branch = "master"` for community stability on modern Neovim versions.
  - Must include `require("nvim-treesitter.install").prefer_git = true` to force Git downloads and prevent tarball extraction errors (`tree-sitter-*-tmp`).
- **Formatting (`conform.nvim`)**:
  - Run via `format_on_save` attached to `BufWritePre`.
  - Must set `require_cwd = true` for `prettier` and `prettierd` to prevent unnecessary Git diffs on team repositories without `.prettierrc`.
  - Set `lsp_fallback = true` so new Mason LSP tools automatically handle formatting without requiring explicit `formatters_by_ft` entries.
- **Markdown Workflow (`markdown.lua`)**:
  - `<leader>mp` -> Browser live split preview (`iamcco/markdown-preview.nvim` with `build = "cd app && npm install"`).
  - `<leader>mt` -> In-buffer rich syntax render toggle (`MeanderingProgrammer/render-markdown.nvim`).
- **File Management (`oil.lua`)**:
  - Use `stevearc/oil.nvim` (`-` keymap) to create, rename, and edit file/folder structures on the fly as text buffers.

---

## 3. Shell & Git Workflow Rules
- **Plugin Manifest**: Track `config/fish/fish_plugins` (acts like `package.json`).
- **Ignored Artifacts**: Generated Fisher runtime files in `functions/`, `conf.d/`, `completions/`, and local machine state (`fish_variables`) MUST remain in `.gitignore`.
- **Theme**: Sonokai palette (explicitly set via `fish_color_*` variables in `config.fish`).

---

## 4. Antigravity Agent Execution Protocol
When generating code, updating configs, or modifying repository files:
1. **Never generate unneeded abstractions**: Always align with standard Neovim / Fish / Shell ecosystem patterns.
2. **Preserve strict syntax structure**: When updating Neovim plugin specs, ensure correct return blocks and lazy loading triggers (`event`, `ft`, `cmd`).
3. **Prevent dirty Git commits**: Check `.gitignore` rules before creating generated configuration artifacts.
