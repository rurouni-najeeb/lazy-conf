return {
  "nvim-telescope/telescope.nvim",
  keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
    {
      "<leader>fH",
      function()
        require("telescope.builtin").find_files({ 
          cwd = vim.fn.expand("~"),
          hidden = true,
          follow = true,
          no_ignore = true,
        })
      end,
      desc = "Find Files in Home Directory",
    },
  },
  -- change some options
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      hidden = true,
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },
}
