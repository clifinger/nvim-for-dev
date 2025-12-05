# Neovim for Dev

This is a Neovim configuration based on **[NvChad](https://nvchad.com/)**. It is designed with **simplicity** in mind, extending NvChad with a curated set of plugins for an enhanced development experience.

The main goal is to build upon NvChad's solid foundation while keeping the customization layer minimal. This setup **respects NvChad's convention of separating custom configurations**, ensuring that the structure remains clean and easy to maintain.

---

## Installation

This configuration is based on NvChad. Before proceeding, ensure you have the necessary prerequisites installed.

### Prerequisites

- **Neovim v0.11+**
- **A Nerd Font** as your terminal font.
  - Make sure the nerd font you set doesn't end with `Mono` to prevent small icons.
  - Example: `JetbrainsMono Nerd Font` and not `JetbrainsMono Nerd Font Mono`.
- **`ripgrep`** is required for grep searching with Snacks Picker (OPTIONAL).
  - **Debian/Ubuntu**: `sudo apt-get install ripgrep`
  - **macOS (Homebrew)**: `brew install ripgrep`
  - **Arch Linux**: `sudo pacman -S ripgrep`
  - **Other**: See the [ripgrep installation guide](https://github.com/BurntSushi/ripgrep#installation).
- **`fd`** is recommended for faster file searching (OPTIONAL).
  - **Debian/Ubuntu**: `sudo apt-get install fd-find`
  - **macOS (Homebrew)**: `brew install fd`
  - **Arch Linux**: `sudo pacman -S fd`
- **`gcc`**:
  - Windows users must have `mingw` installed and set on path.
- **`make`**:
  - Windows users must have `GnuWin32` installed and set on path.
- **`mise` or `asdf`**: For managing tool versions (optional, but recommended).
  - Follow the official instructions at the [mise website](https://mise.jdx.dev/getting-started.html) or the [asdf website](https://asdf-vm.com/guide/getting-started.html) to install it.
- **`delve`** (for Go debugging): Required for debugging Go applications.
  - **Installation**: `go install github.com/go-delve/delve/cmd/dlv@latest`
  - Make sure `$GOPATH/bin` is in your PATH.
  - See the [Delve installation guide](https://github.com/go-delve/delve/tree/master/Documentation/installation) for more details.

Before installation, make sure to delete your old Neovim folders:

```bash
# For Linux/macOS
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
```

### Setup

1. **Clone the repository**:

    ```bash
    git clone https://github.com/clifinger/nvim-for-dev.git ~/.config/nvim
    ```

2. **Launch Neovim**:

    Open Neovim. The plugins will be installed automatically on the first run.

    ```bash
    nvim
    ```

3. **Install Tools**:

    Run the `:MasonInstallAll` command after `lazy.nvim` finishes downloading plugins to install all the necessary LSPs, formatters, and linters.

---

## Update

To update the configuration and plugins, use the `Lazy sync` command.

---

## Additional Plugins

The following plugins have been added to enhance the core functionality:

| Plugin | Description |
|---|---|
| **[Copilot](https://github.com/github/copilot.vim)** | Integrates GitHub Copilot to provide AI-powered code completion. |
| **[CopilotChat](https://github.com/CopilotC-Nvim/CopilotChat.nvim)** | Enables a chat interface to interact with GitHub Copilot directly within Neovim. |
| **[oil.nvim](https://github.com/stevearc/oil.nvim)** | A file explorer that treats directories like editable buffers for seamless navigation and file operations. |
| **[spectre.nvim](https://github.com/nvim-pack/nvim-spectre)** | A powerful project-wide search and replace tool. |
| **[lazygit](https://github.com/folke/snacks.nvim/blob/main/docs/lazygit.md)** | Provides an integration for the [lazygit](https://github.com/jesseduffield/lazygit) terminal UI for a more intuitive Git workflow. |
| **[noice.nvim](https://github.com/folke/noice.nvim)** | A plugin for better UI for messages, cmdline and popups. |
| **[telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)** | A Telescope extension to use Telescope for `vim.ui.select`. |
| **[nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)** | Shows the context of the function/class you are in at the top of the editor. |
| **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** | Adds indentation guides. |
| **[render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)** | Renders markdown in a buffer. |
| **[mini.ai](https://github.com/echasnovski/mini.ai)** | Extends text objects and motions for nodes in the syntax tree, enhancing code manipulation. |
| **[nvim-dap](https://github.com/mfussenegger/nvim-dap)** | Debug Adapter Protocol client for debugging applications in Neovim. |
| **[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)** | A UI for nvim-dap which provides a nice debugging experience. |
| **[nvim-dap-go](https://github.com/leoluz/nvim-dap-go)** | Extension for nvim-dap providing configurations for launching Go debugger (Delve). |
| **[nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text)** | Adds virtual text support to nvim-dap for showing variable values inline. |

---

## Language Support

By default, this configuration adds support (LSP, formatting, linting) for the following languages, aiming to cover the most common development needs:

- **Common Development:** Python
- **Web Development:** JavaScript / TypeScript, HTML / CSS, TailwindCSS
- **Systems Development:** Rustlang, Ziglang, Golang
- **Config & Data Files:** JSON, YAML, TOML
- **Documentation:** Markdown

---

## Custom Shortcuts

In addition to NvChad's defaults, the following shortcuts have been added to facilitate common actions.

### Editing, Windows & Terminal

| Shortcut | Action |
| :--- | :--- |
| `jk` | (Insert Mode) Exit Insert mode to return to Normal mode. |
| `S-K` | (Normal Mode) See documentation/signature for the current word under the cursor. |
| `<c-s>` | Save the current file and return to Normal mode. |
| `<c-q>` | Close the current window, split, buffer or exit Neovim |
| `<leader><leader>` | Find files in the project (Telescope). |
| `<leader>v` | Create a new vertical split. |
| `<leader>h` | Create a new horizontal split. |
| `<c-h>`, `<c-j>`, `<c-k>`, `<c-l>` | Navigate between splits (left, down, up, right). |
| `<M-i>` | Open a terminal in a floating window. |
| `<M-h>` | Open a terminal in a new horizontal split. |
| `<M-v>` | Open a terminal in a new vertical split. |
| `<c-x>` | (Terminal Mode) Switch back to Normal mode. |
| `<leader>fr` | Find and replace text in the current file (spectre). |

### Plugins

| Shortcut | Action |
| :--- | :--- |
| `<leader>gg` | Launch the Lazygit interface. |
| `<leader>aa` | Toggle the Copilot Chat panel. |
| `<leader>aA` | Toggle Copilot completions on/off. |
| `<c-y>` | Accept a Copilot completion suggestion or a diff |
| `-` | Toggle the Oil file explorer. |
| `<leader>aq` | Quick Chat(Copilot). |
| `<leader>ap` | Prompt actions (Copilot). |
| `<leader>ax` | Clear chat (Copilot). |
| `q` | Close the Copilot Chat panel in Normal Mode. Close Nvim-Tree |
| `<leader>snl` | Show last message (Noice). |
| `<leader>snh` | Show history (Noice). |
| `<leader>sna` | Show all messages (Noice). |
| `<leader>snd` | Dismiss all messages (Noice). |
| `<leader>ut` | Toggle Treesitter Context. |
| `<leader>ug` | Toggle Indentation Guides. |

### Debugging (Go with Delve)

| Shortcut | Action |
| :--- | :--- |
| `<leader>db` | Toggle breakpoint at current line. |
| `<leader>dB` | Set a conditional breakpoint. |
| `<leader>dc` | Continue execution / Start debugging. |
| `<leader>dC` | Run to cursor position. |
| `<leader>di` | Step into function. |
| `<leader>do` | Step over function. |
| `<leader>dO` | Step out of current function. |
| `<leader>dj` | Move down in the call stack. |
| `<leader>dk` | Move up in the call stack. |
| `<leader>dr` | Toggle REPL (Read-Eval-Print Loop). |
| `<leader>dt` | Terminate debugging session. |
| `<leader>dp` | Pause execution. |
| `<leader>du` | Toggle DAP UI (debugging interface). |
| `<leader>de` | Evaluate expression under cursor or selection. |
| `<leader>dgt` | Debug the Go test under cursor. |
| `<leader>dgl` | Debug the last Go test. |

---

## Future Plans

- Adapt the `lazygit` plugin integration to automatically apply the NvChad `base64` theme.
