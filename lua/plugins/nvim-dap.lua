-- dap, dap-ui, virtual-text and the <leader>d* keymaps now come from the
-- dap.core extra; nvim-dap-python from lang.python; js-debug-adapter from
-- lang.typescript (via mason, replacing the hand-built vscode-js-debug).
-- Only the emoji breakpoint signs are kept.
return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "🟡", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
      )
      vim.fn.sign_define("DapLogPoint", { text = "🟢", texthl = "DapLogPoint", linehl = "", numhl = "" })
      vim.fn.sign_define(
        "DapStopped",
        { text = "➡️", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" }
      )
      vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "❌", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
      )
    end,
  },
}
