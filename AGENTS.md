# AGENTS.md

Project guide for AI agents (Claude Code, Copilot, etc.) working on this repo.

## What this is

A personal Neovim configuration managed with [lazy.nvim](https://github.com/folke/lazy.nvim) and [mason.nvim](https://github.com/williamboman/mason.nvim). Primary use case: editing Python and Jupyter notebooks. Secondary: TypeScript/Angular, Lua, Rust.

## Layout

```
init.lua                     # bootstraps lazy.nvim, loads remap, requires all plugins
lua/remap.lua                # global options + non-plugin keymaps
lua/plugins/<name>.lua       # one plugin per file; each returns a lazy.nvim spec table
docs/KEYMAPS.md              # full keybinding reference (keep in sync with config)
docs/SETUP.md                # macOS + Arch Linux install steps (keep in sync with system deps)
docs/JUPYTER.md              # notebook workflow guide (keep in sync with molten/jupytext config)
lazy-lock.json               # plugin commit lockfile, managed by :Lazy sync
```

`init.lua` walks `lua/plugins/` and loads every file — adding a new plugin just means dropping a new file in that directory.

## Conventions

- **Every keymap gets a `desc` field.** which-key auto-picks them up; without `desc` the popup just shows the raw `lhs`.
- **New `<leader>` prefix? Register a group** in [`lua/plugins/which-key.lua`](lua/plugins/which-key.lua) so the popup labels it.
- **One plugin per file** under `lua/plugins/`. Don't bundle unrelated plugins together.
- **LSP servers go in [`lua/plugins/nvim-cmp.lua`](lua/plugins/nvim-cmp.lua)**: add to `ensure_installed` and (if non-default config is needed) add a handler under `handlers = { ... }`.
- **Formatters go in [`lua/plugins/conform.lua`](lua/plugins/conform.lua)**: add to `formatters_by_ft`. Mason will *not* install these automatically — install via system package manager or `mason-tool-installer` if added.
- **Treesitter parsers go in [`lua/plugins/treesitter.lua`](lua/plugins/treesitter.lua)** (`ensure_installed`).
- **When you add or change a binding, update [`docs/KEYMAPS.md`](docs/KEYMAPS.md)** in the same change.
- **When you change the Jupyter/notebook stack** (molten config, jupytext options, new kernel workflow), update [`docs/JUPYTER.md`](docs/JUPYTER.md).
- **When you add or change a system-level dependency, update [`docs/SETUP.md`](docs/SETUP.md)** for *both* the macOS (Homebrew) and Arch Linux (pacman / pip) sections. Examples that require an update: a new LSP whose binary isn't installed by Mason, a new formatter, a new image backend, a different Python package, a new terminal requirement. If a change only affects pure Lua plugins managed by lazy.nvim, no update needed.

## Python / Jupyter setup

The Jupyter stack is **molten-nvim + jupytext.nvim + quarto-nvim + image.nvim**. `.ipynb` files are converted to markdown on read by jupytext; molten executes cells against a Jupyter kernel; image.nvim renders matplotlib output inline (Kitty terminal required).

### One-time install (after `git pull` of this config)

```bash
# system
brew install imagemagick

# Python — install into the env you'll use for notebooks (or your nvim-host env)
pip install pynvim jupyter_client cairosvg pnglatex pillow ipykernel debugpy
```

Then in Neovim:

```vim
:Lazy sync
:UpdateRemotePlugins
```

Restart Neovim.

### Smoke test

1. Open `scratch.py`, add `# %%` cell markers and `print("hi")`.
2. `:MoltenInit python3` — picks the kernel.
3. `<leader>ml` on a line — output appears as virtual text.
4. `import matplotlib.pyplot as plt; plt.plot([1,2,3]); plt.show()` — image renders inline (Kitty).

## Language servers

| Filetype | LSP(s) | Where |
|---|---|---|
| Python | `pyright` (types/hover) + `ruff` (lint) — interpreter managed by venv-selector.nvim | nvim-cmp.lua handlers |
| Lua | `lua_ls` | nvim-cmp.lua handlers |
| TypeScript / JS | `ts_ls`, `eslint` | nvim-cmp.lua handlers |
| Rust | `rust_analyzer` | default handler |
| CSS / SCSS | `cssls` | nvim-cmp.lua handlers |
| HTML / Tailwind / Angular / Astro | `tailwindcss`, `angularls`, `astro` | nvim-cmp.lua handlers |
| JSON | `jsonls` | default handler |

`ruff`'s `hoverProvider` is intentionally disabled so `pyright` owns hovers (avoids dual hover popups).

## Formatters (conform.nvim)

| Filetype | Chain |
|---|---|
| Python | `ruff_organize_imports` → `ruff_format` |
| Lua | `stylua` |
| JS/TS/JSON/CSS/HTML/Markdown | `prettierd` then `prettier` (first available) |

`<leader>F` triggers a format. Formatters must be installed externally (e.g. `pip install ruff`, `brew install stylua prettierd`).

## Keybinding reference

See [`docs/KEYMAPS.md`](docs/KEYMAPS.md). Anything not in that file is either a default Neovim keymap or hasn't been documented yet — fix the latter.

## Don't

- Don't manually edit `lazy-lock.json` — let `:Lazy sync` rewrite it.
- Don't add Java tooling. It was removed deliberately. The user doesn't write Java.
- Don't replace `pyright` with `basedpyright` or `pylsp` without checking with the user — pyright is the chosen default.
- Don't add `<leader>t` as a non-prefix mapping; that key is the tabby tab group.

## Adding a new plugin: checklist

1. Create `lua/plugins/<name>.lua` returning a lazy.nvim spec.
2. If it adds an LSP, formatter, or treesitter parser, also update the relevant central file (see Conventions).
3. If it introduces a new `<leader>` prefix, register the group in `which-key.lua`.
4. Add every new keymap to `docs/KEYMAPS.md` with a `desc` field on the mapping itself.
5. Run `:Lazy sync` and check `:checkhealth` for the plugin.
