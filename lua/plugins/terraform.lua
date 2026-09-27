-- The lang.terraform extra assumes HashiCorp's toolchain. This machine has
-- OpenTofu instead, and no packer at all.
return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      -- `tofu validate` only works in a directory where `tofu init` has cached
      -- the providers, so in an editor it mostly reports things like
      -- "no package for registry.opentofu.org/hashicorp/aws 5.100.0 cached in
      -- .terraform/providers". tofu_ls already publishes validation
      -- diagnostics and tflint covers the lint rules, so this is pure noise.
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.terraform = {}
      opts.linters_by_ft.tf = {}
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- packer_fmt is the extra's default here and would ENOENT
        hcl = { "terraform_fmt" },
      },
    },
  },
}
