return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run current file tests" },
      { "<leader>td", function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug nearest test" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Open test output" },
      { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel" },
      { "<leader>tw", function() require("neotest").watch.toggle() end, desc = "Toggle watch mode" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            args = {"--log-level", "DEBUG"},
            runner = "pytest",
          }),
          require("neotest-jest")({
            jestCommand = "npx jest",
          }),
          require("neotest-vitest"),
        },
        discovery = {
          enabled = true,
        },
        running = {
          concurrent = true,
        },
        summary = {
          animated = true,
        },
      })
    end,
  },
}
