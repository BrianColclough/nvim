# Jupyter Notebooks in Neovim

This config supports `.ipynb` files via **molten-nvim** (cell execution) + **jupytext.nvim** (notebook ↔ markdown conversion) + **quarto-nvim** (LSP inside cells) + **image.nvim** (inline plot rendering in Kitty).

---

## Prerequisites

### 1. Install Python dependencies

```bash
pip install pynvim jupyter_client cairosvg pnglatex pillow ipykernel ruff jupytext
```

`jupytext` converts `.ipynb` ↔ markdown. `pynvim` is required for molten-nvim to talk to Neovim. All others are Jupyter runtime deps.

### 2. Install plugins and register the remote plugin

molten-nvim is a Python remote plugin — it needs an extra registration step that is separate from `:Lazy sync`:

```vim
:Lazy sync
```

Wait for it to finish, then:

```vim
:UpdateRemotePlugins
```

**Restart Neovim.** This step is mandatory — molten's commands (`:MoltenInit`, etc.) are only available after a restart following `:UpdateRemotePlugins`. If you see `Not an editor command: MoltenInit`, this step was skipped or Neovim wasn't restarted.

### 3. Verify

```vim
:checkhealth molten
```

Should show no errors. If it reports a missing Python provider, see the troubleshooting section below.

---

## How it works

When you open a `.ipynb` file, **jupytext.nvim** transparently converts it to a markdown representation in memory. Each cell becomes a fenced code block:

````markdown
# %% [markdown]
This is a markdown cell.

```python
# %% a code cell title
import pandas as pd
df = pd.read_csv("data.csv")
df.head()
```
````

You edit this markdown. When you save (`:w`), jupytext converts it back to `.ipynb` on disk — the original file format is preserved and Jupyter can still open it normally.

---

## Opening a notebook

```bash
nvim my_notebook.ipynb
```

The file will open looking like markdown, not JSON. That's correct.

---

## Running cells

First, start a kernel (do this once per Neovim session):

```vim
:MoltenInit python3
```

You can also specify a kernel by name if you have project-specific kernels:

```vim
:MoltenInit myproject
```

Then use these keymaps (leader = `<space>`):

| Keys | Mode | Action |
|---|---|---|
| `<leader>mi` | n | Init kernel |
| `<leader>ml` | n | Run current line as a cell |
| `<leader>me` | n | Run with operator (e.g. `<leader>meip` = run paragraph) |
| `<leader>mc` | n | Re-run current cell |
| `<leader>mv` | v | Run visual selection |
| `<leader>mo` | n | Enter the output window (scroll long output) |
| `<leader>mh` | n | Hide output |
| `<leader>mq` | n | Delete cell output |

Output appears as virtual text below the cell. For plots, the image renders inline (requires Kitty terminal — see below).

### Running the whole notebook

Molten itself only evaluates lines/operators/visual selections — it doesn't know what a "cell" is. The cell-aware "run everything" commands come from **quarto-nvim**, which is configured here to dispatch to molten:

| Keys | Action |
|---|---|
| `<leader>mA` | Run **all** cells in the buffer |
| `<leader>mB` | Run all cells **below** the cursor |
| `<leader>mU` | Run all cells **above** the cursor |
| `<leader>mC` | Run the current cell (whole markdown fence) |

These understand the ` ```python ... ``` ` cell fences that jupytext produces, so they Just Work on a `.ipynb` opened through this config. Equivalent function form: `:lua require("quarto.runner").run_all()`.

> Make sure you've called `:MoltenInit python3` once first — quarto's runner dispatches to whatever kernel molten has attached. If no kernel is running, the calls become no-ops.

### Persisting cell outputs between sessions

By default, cell outputs disappear when you close Neovim. To save outputs and reload them next session:

| Keys | Action |
|---|---|
| `<leader>mS` | Save all cell outputs to `~/.local/share/nvim/molten/<notebook>.json` |
| `<leader>mL` | Load saved outputs back (run after reopening the notebook) |

**Tip:** pair `<leader>mL` with `<leader>mA` to reload then re-run everything if outputs are stale.

### Auto-init kernel

When you open a `.ipynb` file, the `python3` kernel starts automatically — no need to call `:MoltenInit python3` manually. To use a different kernel, call `:MoltenInit <kernel>` after the file loads.

---

## Inline plots (Kitty)

If you're using Kitty (or another terminal that speaks the Kitty graphics protocol — Ghostty, WezTerm), `matplotlib` plots render inline automatically:

```python
import matplotlib.pyplot as plt
plt.plot([1, 2, 3, 4])
plt.title("hello")
plt.show()
```

Run the cell with `<leader>ml` — a plot appears below the line.

If you're on a non-Kitty terminal, the plot won't render inline. You can still display it externally by not calling `plt.show()` and instead saving to a file, or by switching to a different backend.

---

## Project-specific kernels

To use a virtualenv or conda env as your kernel:

```bash
# activate your env first
source .venv/bin/activate

# register it as a Jupyter kernel
python -m ipykernel install --user --name myproject --display-name "My Project"
```

Then in Neovim:

```vim
:MoltenInit myproject
```

---

## Saving and round-tripping

- `:w` writes the markdown back to `.ipynb` — safe to open in Jupyter afterwards.
- Cell outputs are **not** stored in the markdown view. Run `:MoltenInit` + your cells to regenerate them in Neovim. The `.ipynb` file on disk retains outputs from any previous Jupyter session.
- If you want to strip outputs from the `.ipynb` (e.g. before committing), run `jupyter nbconvert --clear-output my_notebook.ipynb`.

---

## Troubleshooting

**File opens as raw JSON**
: `jupytext` CLI is not installed. Run `pip install jupytext` in the Python env Neovim uses, then reopen the file.

**`:MoltenInit` fails with "no Python provider"**
: `pynvim` is not installed in the Python Neovim is using. Check `:checkhealth provider.python`, fix `vim.g.python3_host_prog` if needed, then `pip install pynvim` into that env.

**`Not an editor command: MoltenInit`**
: `:UpdateRemotePlugins` was never run, or Neovim wasn't restarted after it ran. Fix: `:Lazy sync` → `:UpdateRemotePlugins` → quit and reopen Neovim.

**`:MoltenInit` fails with "remote plugin not registered"**
: Same cause as above — run `:UpdateRemotePlugins` and restart Neovim.

**No inline images**
: Your terminal doesn't support the Kitty graphics protocol. Works: Kitty, Ghostty, WezTerm. Doesn't work: Terminal.app, iTerm2, Alacritty. Cell output still appears as text.

**Output window is huge**
: `vim.g.molten_output_win_max_height` in [`lua/plugins/molten.lua`](../lua/plugins/molten.lua) caps it at 20 lines. Adjust to taste. Use `<leader>mo` to scroll inside it.
