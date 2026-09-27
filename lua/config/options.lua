-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Read by lazyvim.plugins.extras.lang.python when it builds its LSP spec
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

-- Native rounded borders for every float (nvim 0.11+)
vim.o.winborder = "rounded"

-- Thinner, quieter window chrome
vim.opt.fillchars:append({
  horiz = "─",
  horizup = "┴",
  horizdown = "┬",
  vert = "│",
  vertleft = "┤",
  vertright = "├",
  verthoriz = "┼",
  eob = " ",
  fold = " ",
  foldopen = "▾",
  foldclose = "▸",
  foldsep = " ",
  diff = "╱",
})

vim.opt.listchars:append({ tab = "→ ", trail = "·", nbsp = "␣", extends = "»", precedes = "«" })

-- Breathing room around the cursor and a subtle column guide
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"
vim.opt.pumblend = 0
vim.opt.winblend = 0
