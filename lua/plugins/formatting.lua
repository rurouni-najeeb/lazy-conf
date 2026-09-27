return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        -- No `terraform` binary on this machine, only OpenTofu. Same CLI surface,
        -- so the stock args still apply.
        terraform_fmt = { command = "tofu" },
      },
      formatters_by_ft = {
        -- lang.python leaves formatting to the ruff LSP; going through conform
        -- makes the order explicit and adds import sorting.
        python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
      },
    },
  },
}
