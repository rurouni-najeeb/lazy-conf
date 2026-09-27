-- Most repos here are poetry projects whose virtualenvs live in the shared
-- cache (~/Library/Caches/pypoetry/virtualenvs), not in a local .venv, so
-- neither basedpyright nor dap-python finds them on its own.
return {
  {
    "linux-cultist/venv-selector.nvim",
    ft = "python",
    dependencies = { "neovim/nvim-lspconfig" },
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" },
    },
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    config = function(_, opts)
      require("venv-selector").setup(opts)
      -- Re-activate the venv previously chosen for this project
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        once = true,
        callback = function()
          pcall(function()
            require("venv-selector").retrieve_from_cache()
          end)
        end,
      })
    end,
  },
}
