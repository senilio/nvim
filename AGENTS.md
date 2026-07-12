# AGENTS.md

Repo: personal Neovim config. Optimize for small, qualitative edits that keep startup clean, avoid plugin overlap, and preserve existing preferences.

## Style
- Keep Lua simple: local variables, no leaked globals, no broad rewrites unless asked.
- Prefer one plugin spec per file in `lua/core/plugins/`.
- Delete stale/disabled configs instead of moving dead files around.
- Do not add comments for obvious settings; existing short comments OK.
- Use current Neovim/Lazy.nvim APIs. Avoid deprecated calls like `vim.lsp.buf.formatting()`.

## Plugin choices / known decisions
- `yazi.nvim` is primary file browser. Do not reintroduce MiniFiles, NvimTree, netrw, or Telescope file-browser unless user asks.
- Built-in directory browser and netrw stay disabled early in `lua/core/options.lua`:
  - `vim.g.loaded_nvim_dir_plugin = 1`
  - `vim.g.loaded_netrw = 1`
  - `vim.g.loaded_netrwPlugin = 1`
- `snacks.nvim` provides bigfile, git, indent/scope, quickfile, statuscolumn, terminal.
- Snacks word-under-cursor highlighting is intentionally disabled:
  - `words = { enabled = false }`
- Snacks indent should behave like minimal `mini.indentscope`: only active cursor scope line visible, muted gray. Base indent guides should stay hidden.
- `mini.indentscope`, `indent-blankline`, `mini-files`, Helm/Jinja specs were removed. Do not restore without explicit reason.
- Keep Telescope for fuzzy finding for now. Do not replace with Snacks picker unless requested.
- Keep Conform with `lsp_format = "fallback"` unless user decides pure LSP formatting is enough.
- Keep Noice/notify stack as UX preference; do not remove as “cleanup” without asking.
- Single LSP setup path lives in `lua/core/plugins/lsp.lua`; avoid duplicate `nvim-lspconfig` specs elsewhere.

## Editing rules
- Before adding plugin, check for existing native/Snacks/Mini equivalent and avoid overlapping behavior.
- Before renaming/removing plugin config, grep for references in mappings, autocommands, bufferline offsets, and lazy specs.
- Prefer small config updates over broad formatting churn.
- Preserve user’s visual choices: dark background, `github_dark`, no mouse, tabs displayed as tabs (`expandtab = false`).
- If a change affects UI highlight groups, verify with current theme and reapply on `ColorScheme` when needed.

## Verification
- After config edits, run:
  - `nvim --headless '+qa'`
- For plugin removal/rename, also grep stale references.
- If touching formatting/LSP/completion, open or headless-load enough to catch setup errors; avoid claiming full behavior verified without an actual interactive check.

## Useful paths
- Core options: `lua/core/options.lua`
- Mappings: `lua/core/mappings.lua`
- Autocmds: `lua/core/autocmd.lua`
- Plugin specs: `lua/core/plugins/*.lua`
- Snacks config: `lua/core/plugins/snacks.lua`
- Formatting: `lua/core/plugins/conform.lua`
- LSP: `lua/core/plugins/lsp.lua`
- Completion: `lua/core/plugins/blink.lua`
- File browser: `lua/core/plugins/yazi.lua`
- Finder: `lua/core/plugins/telescope.lua`
