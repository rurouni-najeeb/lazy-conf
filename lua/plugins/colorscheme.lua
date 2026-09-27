return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      background = { light = "latte", dark = "mocha" },
      -- iTerm already paints #1e1e2e with blur behind it, so let it show through
      transparent_background = true,
      show_end_of_buffer = false,
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        keywords = { "bold" },
      },
      integrations = {
        blink_cmp = true,
        gitsigns = true,
        grug_far = true,
        lsp_trouble = true,
        mason = true,
        mini = { enabled = true },
        native_lsp = {
          enabled = true,
          virtual_text = { errors = { "italic" }, hints = { "italic" } },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotest = true,
        noice = true,
        notify = true,
        nvim_surround = true,
        which_key = true,
        dap = true,
        dap_ui = true,
        copilot_vim = true,
        flash = true,
        illuminate = true,
        markview = true,
        render_markdown = true,
        treesitter_context = true,
        telescope = { enabled = true },
        indent_blankline = { enabled = true, scope_color = "lavender" },
        snacks = { enabled = true, indent_scope_color = "lavender" },
      },
      custom_highlights = function(c)
        return {
          -- Make the active window obvious without a heavy border
          WinSeparator = { fg = c.surface1 },
          CursorLineNr = { fg = c.peach, style = { "bold" } },
          -- Floating windows keep a solid backdrop so text stays readable
          NormalFloat = { bg = c.mantle },
          FloatBorder = { fg = c.surface2, bg = c.mantle },
          FloatTitle = { fg = c.mauve, bg = c.mantle, style = { "bold" } },
          -- Dim inactive text slightly
          MsgArea = { fg = c.subtext0 },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
