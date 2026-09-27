return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>cc", desc = "Toggle Claude Code" },
    { "<leader>cC", desc = "Claude Code Continue" },
    { "<leader>cR", desc = "Claude Code Resume" },
  },
  config = function()
    require("claude-code").setup({
      window = {
        position = "vertical",
        split_ratio = 0.4,
      },
    })
  end,
}
