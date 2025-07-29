return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        number = 1,
        direction = "float", -- or "horizontal", "vertical", "tab"
        open_mapping = [[<leader>t1]], -- default toggle key
      })
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}
