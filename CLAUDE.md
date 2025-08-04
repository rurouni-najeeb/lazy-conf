# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## NeoVim Configuration

This repository contains a NeoVim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim), a starter template that provides sensible defaults and a plugin management system using [lazy.nvim](https://github.com/folke/lazy.nvim).

## Code Architecture

### Core Structure

- `init.lua`: Entry point that bootstraps lazy.nvim and loads the configuration
- `lua/config/`: Contains core configuration files
  - `lazy.lua`: Sets up lazy.nvim plugin manager and basic configuration
  - `options.lua`: Neovim options (extends LazyVim defaults)
  - `keymaps.lua`: Key mappings (extends LazyVim defaults)
  - `autocmds.lua`: Autocommands (extends LazyVim defaults)
- `lua/plugins/`: Contains plugin specifications
  - Each file in this directory defines plugins to be loaded by lazy.nvim
  - Plugins can be added, configured, or disabled here

### Plugin System

The configuration uses lazy.nvim for plugin management with these characteristics:
- Plugins are defined in lua files under `lua/plugins/`
- The base LazyVim plugins are imported through `{ "LazyVim/LazyVim", import = "lazyvim.plugins" }`
- Additional plugin configurations override or extend the defaults
- By default, custom plugins load during startup (not lazy-loaded) unless specified otherwise

### Notable Plugins

- `codecompanion.nvim`: AI coding assistant with chat interface
- `copilot.vim`: GitHub Copilot integration
- Standard LazyVim plugins for LSP, completion, syntax highlighting, etc.

## Common Commands

### Plugin Management

- `:Lazy`: Open the lazy.nvim interface
  - `S`: Sync plugins (install, clean, update)
  - `U`: Update plugins
  - `C`: Clean unused plugins

### Linting and Formatting

- The configuration uses stylua for Lua formatting with these settings:
  - Indent type: Spaces
  - Indent width: 2
  - Column width: 120
  
- Mason is used to install and manage LSP servers, linters and formatters. Common tools include:
  - `stylua`: Lua formatter
  - `shellcheck`: Shell script linter
  - `shfmt`: Shell formatter
  - `flake8`: Python linter

### CodeCompanion Usage

CodeCompanion (AI assistant) is configured with these keybindings:
- `<leader>h`: Start Chat
- `<leader>ha`: Actions Menu
- `<leader>hq`: Quick Chat
- `:CC`: Alias for CodeCompanion command

## Development Workflow

This is primarily a NeoVim configuration repository. When modifying:

1. Edit configuration files in `lua/config/` or add/modify plugin specifications in `lua/plugins/`
2. Restart NeoVim or use `:Lazy sync` to apply changes
3. Follow LazyVim conventions for structure and formatting