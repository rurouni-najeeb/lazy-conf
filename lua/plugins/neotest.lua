-- Core neotest, keymaps and the python adapter come from the test.core and
-- lang.python extras. Only the adapter tweaks and extra JS runners live here.
return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      opts.adapters["neotest-python"] = {
        dap = { justMyCode = false },
        runner = "pytest",
        args = { "--log-level", "DEBUG" },
      }
      opts.adapters["neotest-jest"] = { jestCommand = "npx jest" }
      opts.adapters["neotest-vitest"] = {}
      opts.discovery = { enabled = true }
      opts.running = { concurrent = true }
      return opts
    end,
  },
}
