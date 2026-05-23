# Keybindings

Reference for every keybinding configured in this Neovim setup. The leader key is `<space>`.

> **Discovery:** press `<leader>` (or any registered prefix) and wait — [which-key.nvim](https://github.com/folke/which-key.nvim) will show available continuations live. This file is the static reference; if it disagrees with the running config, the config wins.
>
> When you add or change a keymap, also update this file and (if introducing a new prefix) register a group in [`lua/plugins/which-key.lua`](../lua/plugins/which-key.lua).

## Conventions

- `n` normal · `i` insert · `v` visual · `x` visual-block · `t` terminal · `s` select · `o` operator-pending
- All `<leader>X` bindings start with `<space>`.

---

## Editing

| Mode | Keys | Action |
|---|---|---|
| `i` | `jk` | Exit insert mode |
| `v` | `J` / `K` | Move selected lines down / up |
| `n` | `J` | Join lines (cursor stays put) |
| `x` | `<leader>p` | Paste over selection without clobbering register |
| `n` | `<leader>F` | Format buffer (conform.nvim) |

## Movement & search

| Mode | Keys | Action |
|---|---|---|
| `n` | `<C-d>` / `<C-u>` | Half-page down / up, cursor centered |
| `n` | `n` / `N` | Next / previous match, centered |
| `n` | `*` | Search word under cursor, centered |
| `n` | `<leader>h` / `j` / `k` / `l` | Move to window left / down / up / right |

## Files & buffers

| Mode | Keys | Action |
|---|---|---|
| `n` | `<leader>w` | Save |
| `n` | `<leader>q` | Quit |
| `n` | `-` | Open parent directory in [oil.nvim](https://github.com/stevearc/oil.nvim) |

## Telescope (`<leader>f` group)

| Keys | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fG` | Grep with prompt |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fl` | Fuzzy find in current buffer |
| `<leader>fp` | Resume previous Telescope picker |
| `<leader>sw` | Grep word under cursor |
| `<leader>sW` | Grep WORD under cursor |
| `<leader>fr` | LSP references |
| `<leader>fi` | LSP incoming calls |
| `<leader>fo` | LSP outgoing calls |
| `<leader>fc` | Git commits |
| `<leader>fs` | Git status |
| `<leader>gb` | Git branches |
| `<C-p>` | Git files |

## Python venv (`<leader>cv`)

| Keys | Action |
|---|---|
| `<leader>cv` | Open virtualenv selector (venv-selector.nvim) |
| `<leader>cV` | Reactivate the last-used virtualenv |

## LSP

Active when an LSP is attached. Python uses `pyright` (types/hover) + `ruff` (lint + format via conform).

| Mode | Keys | Action |
|---|---|---|
| `n` | `gD` | Go to declaration |
| `n` | `gd` | Go to definition |
| `n` | `gi` | Go to implementation |
| `n` | `gr` | References |
| `n` | `K` | Hover |
| `n` | `<C-k>` | Signature help |
| `n` | `<leader>D` | Type definition |
| `n` | `<leader>rn` | Rename |
| `n,v` | `<leader>ca` | Code action |
| `n` | `<leader>f` | LSP format buffer (raw `vim.lsp.buf.format`) |
| `n` | `<leader>wa` / `wr` / `wl` | Workspace folder add / remove / list |
| `n` | `[d` / `]d` | Next / previous diagnostic |

## Trouble (`<leader>x` group)

| Keys | Action |
|---|---|
| `<leader>xx` | Toggle Trouble |
| `<leader>xw` | Workspace diagnostics |
| `<leader>xd` | Document diagnostics |
| `<leader>xq` | Quickfix |
| `<leader>xl` | Location list |
| `[x` / `]x` | Previous / next Trouble item |
| `gR` | LSP references in Trouble |

## Git

### Fugitive

| Keys | Action |
|---|---|
| `<leader>gs` | `:Git` (status) |
| `<leader>p` | Push (in Fugitive buffer) |
| `<leader>P` | Pull --merge (in Fugitive buffer) |
| `<leader>t` | `:Git push -u origin ` (in Fugitive buffer; type branch then `<CR>`) |
| `gu` / `gh` | Diffget left / right (merge conflicts) |
| `<leader>g` | Open LazyGit |

### Gitsigns hunks (`<leader>h` group)

| Mode | Keys | Action |
|---|---|---|
| `n` | `]c` / `[c` | Next / previous hunk |
| `n,v` | `<leader>hs` | Stage hunk |
| `n,v` | `<leader>hr` | Reset hunk |
| `n` | `<leader>hS` | Stage buffer |
| `n` | `<leader>hu` | Undo stage |
| `n` | `<leader>hR` | Reset buffer |
| `n` | `<leader>hp` | Preview hunk |
| `n` | `<leader>hb` | Blame line |
| `n` | `<leader>hd` / `hD` | Diff this / vs HEAD |
| `n` | `<leader>tb` | Toggle inline blame |
| `n` | `<leader>td` | Toggle deleted |
| `o,x` | `ih` | Text object: inside hunk |

## Harpoon (`<leader>m*` and `<C-*>`)

| Keys | Action |
|---|---|
| `<leader>a` | Add file to harpoon list |
| `<C-e>` | Toggle quick menu |
| `<leader>ma` / `ms` / `md` / `mf` | Jump to slot 1 / 2 / 3 / 4 |
| `<C-S-P>` / `<C-S-N>` | Previous / next harpoon entry |

## Molten — Jupyter cells (`<leader>m*`)

| Mode | Keys | Action |
|---|---|---|
| `n` | `<leader>mi` | Init kernel (`:MoltenInit`) |
| `n` | `<leader>me` | Evaluate operator |
| `n` | `<leader>ml` | Evaluate line |
| `n` | `<leader>mc` | Re-evaluate cell |
| `v` | `<leader>mv` | Evaluate visual |
| `n` | `<leader>mo` | Enter output window |
| `n` | `<leader>mh` | Hide output |
| `n` | `<leader>mq` | Delete cell |
| `n` | `<leader>mS` | Save cell outputs to disk |
| `n` | `<leader>mL` | Load cell outputs from disk |
| `n` | `<leader>mA` | Run **all** cells (via quarto runner) |
| `n` | `<leader>mB` | Run all cells **below** cursor |
| `n` | `<leader>mU` | Run all cells **above** cursor (Up) |
| `n` | `<leader>mC` | Run current cell (markdown-fence aware) |

> Harpoon and Molten share the `<leader>m` prefix but use disjoint suffixes. See [`AGENTS.md`](../AGENTS.md) for the Python/Jupyter setup steps.

## Tabs (Tabby, `<leader>t` group)

| Keys | Action |
|---|---|
| `<leader>ta` | New tab |
| `<leader>tc` | Close tab |
| `<leader>to` | Close all other tabs |
| `<leader>tn` / `tp` | Next / previous tab |
| `<leader>tmn` / `tmp` | Move tab forward / back |
| `<Tab>` / `<S-Tab>` | Next / previous tab |

## Completion (nvim-cmp, insert mode)

| Keys | Action |
|---|---|
| `<C-Space>` | Trigger menu |
| `<C-n>` / `<C-p>` | Next / previous item |
| `<CR>` | Confirm selection |
| `<C-e>` | Abort menu |
| `<C-b>` / `<C-f>` | Scroll docs up / down |

## Snippets (LuaSnip)

| Mode | Keys | Action |
|---|---|---|
| `i` | `<C-k>` | Expand or jump forward |
| `i,s` | `<C-j>` | Jump backward |
| `i,s` | `<c-l>` | Cycle choice node |

## Copilot

| Mode | Keys | Action |
|---|---|---|
| `i` | `<C-c>` | Accept Copilot suggestion |

### CopilotChat (`<leader>cc` group)

| Mode | Keys | Action |
|---|---|---|
| `n` | `<leader>cc` | Open chat |
| `n` | `<leader>ccm` | Generate commit message |
| `n` | `<leader>cct` | Generate tests |
| `n,v` | `<leader>cce` | Explain |
| `n,v` | `<leader>ccr` | Review |
| `n,v` | `<leader>ccR` | Refactor |
| `n,v` | `<leader>ccn` | Suggest better names |
| `n,v` | `<leader>ccd` | Generate documentation |
| `n,v` | `<leader>ccf` | Fix code |
| `n,v` | `<leader>ccF` | Fix diagnostic |

## Notes / Markdown (`<leader>n` group)

Active in `markdown` / `quarto` buffers. Vault-aware commands target the
Obsidian vault registered in [`lua/plugins/obsidian.lua`](../lua/plugins/obsidian.lua).
Plain markdown files outside the vault still get rendering, spell, soft wrap,
and the `marksman` LSP — they just don't get backlinks/daily-notes.

| Mode | Keys | Action |
|---|---|---|
| `n` | `<leader>nn` | New note in vault (`:ObsidianNew`) |
| `n` | `<leader>nf` | Find note by filename (`:ObsidianQuickSwitch`) |
| `n` | `<leader>ng` | Grep notes (`:ObsidianSearch`) |
| `n` | `<leader>nt` | Today's daily note (`:ObsidianToday`) |
| `n` | `<leader>ny` | Yesterday's daily note (`:ObsidianYesterday`) |
| `n` | `<leader>nl` | Follow link under cursor (`:ObsidianFollowLink`) |
| `n` | `<leader>nb` | Show backlinks (`:ObsidianBacklinks`) |
| `n` | `<leader>no` | Open note in Obsidian app (`:ObsidianOpen`) |
| `n` | `<leader>nT` | Insert template (`:ObsidianTemplate`) |
| `v` | `<leader>nL` | Wrap selection in `[[wikilink]]` (`:ObsidianLink`) |
| `n` | `<leader>nr` | Toggle pretty render (`:RenderMarkdown toggle`) |

Buffer-local prose settings (set automatically on `FileType markdown` /
`quarto` by [`lua/plugins/markdown-prose.lua`](../lua/plugins/markdown-prose.lua)):
soft wrap, spell-check, `conceallevel=2`, and `j` / `k` / `0` / `$` remapped
to their visual-line variants (`gj` / `gk` / `g0` / `g$`).

## Misc

| Keys | Action |
|---|---|
| `<leader>u` | Toggle undo tree |
| `<leader>zz` | Zen mode |
| `<leader>zZ` | Zen mode (80 columns) |

## Comment.nvim (default operators)

| Keys | Action |
|---|---|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc` / `gb` | Operator-pending line / block comment |
| `gcO` / `gco` | Add comment above / below |
| `gcA` | Add comment at end of line |

## Surround (default)

`ys{motion}{char}` add · `cs{old}{new}` change · `ds{char}` delete · in visual: `S{char}`.

## Debug (nvim-dap, `<leader>d` group)

| Mode | Keys | Action |
|---|---|---|
| `n` | `<leader>db` | Toggle breakpoint |
| `n` | `<leader>dB` | Conditional breakpoint |
| `n` | `<leader>dc` | Continue |
| `n` | `<leader>di` | Step into |
| `n` | `<leader>do` | Step over |
| `n` | `<leader>dO` | Step out |
| `n` | `<leader>dr` | Open REPL |
| `n` | `<leader>dl` | Run last configuration |
| `n` | `<leader>du` | Toggle DAP UI |
| `n` | `<leader>dq` | Quit / terminate session |
| `n,v` | `<leader>de` | Evaluate expression under cursor |
| `n` | `<leader>dtp` | Debug test method under cursor |

## Tests (neotest, `<leader>dt` group)

| Keys | Action |
|---|---|
| `<leader>dtr` | Run nearest test |
| `<leader>dtf` | Run all tests in file |
| `<leader>dts` | Toggle test summary panel |
| `<leader>dto` | Toggle test output panel |
| `<leader>dtx` | Stop running tests |
| `[t` / `]t` | Jump to previous / next failed test |

---

## Known prefix overlaps

These work but cause a brief `timeoutlen` delay because the bare key is mapped *and* a prefix:

- `<leader>h` — bare: window-left; prefix: gitsigns hunks
- `<leader>w` — bare: save; prefix: LSP workspace (`wa`/`wr`/`wl`)
- `<leader>p` — `x`-mode paste; `n`-mode Fugitive push (different modes, no conflict)

If a delay annoys you, rebind the bare key (or move the prefix). which-key will pop up the menu during the wait.
