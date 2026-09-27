return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- basedpyright (chosen in config/options.lua) covers this, and pylsp
        -- also claimed documentFormatting, making the formatter ambiguous.
        pylsp = { enabled = false },

        -- We use OpenTofu, so tofu_ls is the source of truth. terraformls
        -- attached to the same buffers and produced duplicate diagnostics.
        terraformls = { enabled = false },
        tofu_ls = {},

        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
      },
    },
  },
}
