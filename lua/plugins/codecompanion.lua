return {
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup()
      vim.api.nvim_create_user_command("CC", "CodeCompanion", {})
    end,
    keys = {
      {
        "<leader>h",
        "<cmd>CodeCompanion<cr>",
        desc = "CodeCompanion: Start Chat",
      },
      {
        "<leader>ha",
        "<cmd>CodeCompanionActions<cr>",
        desc = "CodeCompanion: Actions Menu",
      },
      {
        "<leader>hq",
        "<cmd>CodeCompanionChat<cr>",
        desc = "CodeCompanion: Quick Chat",
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
  {
    "nvim-mini/mini.diff",
    config = function()
      require("mini.diff").setup({
        source = require("mini.diff").gen_source.none(),
      })
    end,
  },
  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },
}
