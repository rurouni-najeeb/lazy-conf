# CRUSH.md

This file provides guidance for coding agents working with this NeoVim configuration repository.

## Commands

### Formatting & Linting
- `stylua .` - Format all Lua files using stylua
- `stylua lua/` - Format only lua directory
- No specific test commands (this is a config repository)

### Plugin Management
- `:Lazy sync` - Install, clean, and update plugins
- `:Lazy update` - Update plugins only
- `:Mason` - Manage LSP servers, linters, formatters

## Code Style Guidelines

### Lua Formatting (stylua.toml)
- Indent: 2 spaces
- Line width: 120 characters
- Use double quotes for strings

### Plugin Configuration Structure
- Plugin specs go in `lua/plugins/` directory
- Each file returns a table of plugin specifications
- Follow LazyVim conventions for plugin configuration
- Use `opts` for simple configuration, `config` for complex setup

### Naming Conventions
- File names: lowercase with hyphens (e.g., `nvim-treesitter.lua`)
- Variable names: snake_case
- Function names: snake_case

### Comments & Documentation
- Use `-- stylua: ignore` to disable formatting for specific lines
- Document complex plugin configurations with comments
- Use `---@param` and `---@type` annotations for type hints

### Error Handling
- Check for plugin availability before configuration
- Use conditional loading with `enabled = false` to disable plugins
- Validate options in plugin setup functions