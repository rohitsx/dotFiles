# Neovim Configuration Installation Guide

This guide will help you install my Neovim configuration based on LazyVim.

## Prerequisites

- Neovim (v0.9+ recommended)
- Git
- Node.js (for LSP servers and formatters)
- Python (for Black formatter)

## Installation Steps

1. Backup your existing Neovim config:

   ```sh
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. Clone this config:

   ```sh
   git clone https://github.com/yourusername/nvim-config ~/.config/nvim
   ```

3. Install dependencies:

   ```sh
   npm install -g prettier typescript typescript-language-server
   pip install black
   ```

4. Start Neovim and wait for plugins to install:
   ```sh
   nvim
   ```

## Key Features & Plugins

### Core Plugins

- **Lazy.nvim**: Plugin manager
- **nvim-lspconfig**: LSP configuration
- **nvim-cmp**: Autocompletion
  - Uses buffer, path, LSP, and snippet sources
- **LuaSnip**: Snippet engine

### Essential Tools

- **telescope.nvim**: Fuzzy finder (files, grep, etc.)
  - Keymaps:
    - `<A-p>`: Find files
    - `<A-f>`: Search in current buffer
    - `<leader>f`: Live grep
- **oil.nvim**: File explorer
  - Keymap: `<leader>e` to open

### Quality of Life

- **nvim-autopairs**: Auto-close brackets
- **copilot.vim**: GitHub Copilot integration
- **notifier.nvim**: Better notifications

### Formatting/Linting

- **none-ls.nvim**: Formatting/linting
  - Includes Prettier, Stylua, Black

## Keymaps

- `<leader>w`: Save file
- `<leader>q`: Quit Neovim
- `<M-x>`: Delete line without yanking
- `<leader>a`: Select entire file
- `<leader>e`: Open file explorer (Oil)

The config will automatically install language servers when you open supported file types. Enjoy!
