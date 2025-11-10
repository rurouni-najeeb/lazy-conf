-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>th", ":split | terminal<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tv", ":vsplit | terminal<CR>", { noremap = true, silent = true })

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

