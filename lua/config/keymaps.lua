-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>th", ":split | terminal<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tv", ":vsplit | terminal<CR>", { noremap = true, silent = true })

-- LazyVim binds the float terminal to <C-/> (and <C-_>), but on a German layout
-- "/" is Shift+7, so that chord is Ctrl+Shift+7 and most terminals send nothing
-- nvim can read. <leader>T is layout-independent.
vim.keymap.set("n", "<leader>T", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

vim.keymap.set("n", "<leader>hc", function()
  vim.g.ai_completion_enabled = not vim.g.ai_completion_enabled
  if vim.g.ai_completion_enabled == nil then
    vim.g.ai_completion_enabled = false
  end
  if vim.g.ai_completion_enabled then
    vim.cmd("Copilot enable")
    vim.notify("AI completions enabled", vim.log.levels.INFO)
  else
    vim.cmd("Copilot disable")
    vim.notify("AI completions disabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle AI Completions" })
