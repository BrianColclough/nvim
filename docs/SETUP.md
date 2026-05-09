# Setup

How to get this Neovim config running from scratch on **macOS** and **Arch Linux**. The two paths share the same end state — only the package manager differs.

> Keep this doc honest: if you change a system-level dependency in the config (a new LSP that needs a system binary, a new image backend, etc.), update the relevant section here.

---

## What you'll end up with

- Neovim ≥ 0.10
- A Kitty-graphics-protocol terminal (for inline matplotlib output)
- Python with `pynvim` + Jupyter client libs (for molten-nvim)
- Node.js (most of the LSPs are npm packages installed by Mason)
- Formatters and CLI tools used by plugins: ImageMagick, ripgrep, fd, lazygit, stylua, prettierd

---

## macOS

### 1. System packages (Homebrew)

```bash
brew install neovim git ripgrep fd imagemagick lazygit stylua node python
brew install --cask kitty                 # or font-hack-nerd-font + your terminal of choice
brew install --cask font-jetbrains-mono-nerd-font
```

> If you already use a Kitty-protocol terminal (Ghostty, WezTerm), skip the `kitty` cask. Other terminals (Terminal.app, iTerm2, Alacritty) work for everything *except* inline image rendering — you'll see molten output as text only.

### 2. Python (Jupyter / molten)

Use whichever Python you'll edit notebooks against — system, pyenv, or a venv. Install into the active environment:

```bash
pip install pynvim jupyter_client cairosvg pnglatex pillow ipykernel ruff jupytext
```

> `ruff` is the Python linter/formatter; conform.nvim shells out to it. Mason also installs a `ruff` LSP — both rely on the `ruff` binary being on `$PATH`.
> `jupytext` is the CLI tool that jupytext.nvim shells out to when opening/saving `.ipynb` files. Without it, `.ipynb` files will display as raw JSON.

### 3. Node-based formatters

```bash
npm install -g prettier prettierd
```

### 4. Clone and bootstrap

```bash
git clone <this-repo> ~/.config/nvim
cd ~/.config/nvim
nvim
# inside nvim:
:Lazy sync                 # installs all plugins
:UpdateRemotePlugins       # registers molten's Python remote plugin
:checkhealth               # verify providers, treesitter, mason
```

Restart Neovim once after `:UpdateRemotePlugins`.

### 5. Smoke test

Open a `.py` file with `# %%` cell markers, then:

```vim
:MoltenInit python3
```

Press `<leader>ml` on a line — output should appear as virtual text.

---

## Arch Linux

### 1. System packages (pacman)

```bash
sudo pacman -S neovim git ripgrep fd imagemagick lazygit stylua nodejs npm python python-pip
sudo pacman -S xclip wl-clipboard          # required for system clipboard ("unnamedplus")
sudo pacman -S ttf-jetbrains-mono-nerd     # or any nerd font from the AUR
```

For a Kitty-protocol terminal:

```bash
sudo pacman -S kitty
# or AUR: ghostty (yay -S ghostty)
# wezterm is in extra: sudo pacman -S wezterm
```

### 2. Python (Jupyter / molten)

Arch's Python is PEP 668-managed — install into a venv (recommended) or use `--user`:

```bash
# venv approach (recommended)
python -m venv ~/.venvs/nvim
source ~/.venvs/nvim/bin/activate
pip install pynvim jupyter_client cairosvg pnglatex pillow ipykernel ruff jupytext

# tell nvim where this Python lives (add to ~/.config/nvim/init.lua or shell rc)
# vim.g.python3_host_prog = vim.fn.expand("~/.venvs/nvim/bin/python")
```

If you go the user-install route instead:

```bash
pip install --user --break-system-packages pynvim jupyter_client cairosvg pnglatex pillow ipykernel ruff jupytext
```

> Setting `vim.g.python3_host_prog` to the venv's `python` is the cleanest pattern — molten and other Python plugins will use exactly that interpreter regardless of what's on `$PATH`.

### 3. Node-based formatters

```bash
sudo npm install -g prettier prettierd
```

### 4. Clone and bootstrap

```bash
git clone <this-repo> ~/.config/nvim
cd ~/.config/nvim
nvim
# inside nvim:
:Lazy sync
:UpdateRemotePlugins
:checkhealth
```

Restart Neovim once after `:UpdateRemotePlugins`.

### 5. Smoke test

Same as macOS: `:MoltenInit python3`, then `<leader>ml` on a line of a `.py` file.

---

## Verifying the install

Run `:checkhealth` and check:

- **provider.python** — `python3_host_prog` resolves and `pynvim` ≥ 1.5 is installed
- **mason** — all configured LSPs install green; if not, `:Mason` and trigger them manually
- **nvim-treesitter** — `python`, `markdown`, `markdown_inline` parsers compiled
- **image.nvim** — backend reports as `kitty`, ImageMagick found
- **molten** — no errors; if `:MoltenInit` says "remote plugin not registered", re-run `:UpdateRemotePlugins` and restart

---

## Common gotchas

- **`:MoltenInit` errors with "no Python provider"** — `pynvim` isn't installed in the Python that nvim uses. Fix `vim.g.python3_host_prog` or install pynvim into the right env.
- **No matplotlib images** — your terminal doesn't speak the Kitty graphics protocol. Confirmed working: Kitty, Ghostty, WezTerm. Not working: Terminal.app, iTerm2, Alacritty, GNOME Terminal.
- **Clipboard yanks vanish on Linux** — install `xclip` (X11) or `wl-clipboard` (Wayland).
- **`ruff` formatter does nothing** — `ruff` binary missing on `$PATH`. `pip install ruff` (or `pacman -S ruff`).
- **TypeScript/Angular LSP missing** — Mason installs npm packages; needs working `node`/`npm`.

---

## Optional but recommended

- **Nerd Font** — without one, nvim-tree, lualine, and trouble icons render as boxes.
- **lazygit config** — see [`~/.config/lazygit/config.yml`](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md) for keybinding tweaks.
- **`ipykernel` per project** — for project-specific kernels: `python -m ipykernel install --user --name myproject`.
