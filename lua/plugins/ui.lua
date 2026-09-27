return {
  -- Flat statusline: coloured text and thin dividers instead of filled blocks
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      -- Leave theme at LazyVim's "auto": catppuccin ships per-flavour themes
      -- (catppuccin-mocha etc.) but no bare "catppuccin", and auto follows
      -- whichever flavour is active anyway.
      opts.options.globalstatus = true
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "│", right = "│" }
      return opts
    end,
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "thin",
        indicator = { style = "underline" },
        show_buffer_close_icons = false,
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "",
            "  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            "  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            "  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            "  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            "  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            "  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
            "",
          }, "\n"),
        },
      },
      indent = {
        indent = { char = "│" },
        scope = { char = "│" },
      },
      scroll = { enabled = true },
      input = { enabled = true },
      gh = {},

      -- Alt-based picker keys are unreachable: iTerm2 sends Option as a compose
      -- modifier, so <M-w>/<M-m> never arrive. <C-e>/<C-l> are unbound in all
      -- three picker windows and byte-distinct from <CR>/<Tab>/<BS>.
      picker = {
        win = {
          input = {
            keys = {
              ["<c-e>"] = { "cycle_win", mode = { "i", "n" } },
              ["<c-l>"] = { "toggle_maximize", mode = { "i", "n" } },
            },
          },
          list = {
            keys = {
              ["<c-e>"] = "cycle_win",
              ["<c-l>"] = "toggle_maximize",
            },
          },
          preview = {
            keys = {
              ["<c-e>"] = "cycle_win",
              ["<c-l>"] = "toggle_maximize",
              ["<c-f>"] = "preview_scroll_down",
              ["<c-b>"] = "preview_scroll_up",
              -- snacks ships no help key for the preview window
              ["?"] = function(self)
                self:toggle_help()
              end,
            },
          },
        },
        sources = {
          -- gh_browse is only on <M-b>, which Option-as-compose never sends
          gh_pr = {
            win = {
              input = { keys = { ["<c-o>"] = { "gh_browse", mode = { "i", "n" } } } },
              list = { keys = { ["<c-o>"] = "gh_browse" } },
            },
          },
          gh_issue = {
            win = {
              input = { keys = { ["<c-o>"] = { "gh_browse", mode = { "i", "n" } } } },
              list = { keys = { ["<c-o>"] = "gh_browse" } },
            },
          },
        },
      },
    },
  },

  -- Upstream snacks bug (as of 882c996): the picker wipes preview scratch buffers
  -- under `eventignore=all`, which suppresses Neovim's own BufWipeout cleanup of
  -- the diagnostic cache. The explorer's DiagnosticChanged handler then calls
  -- nvim_buf_get_name on a dead bufnr and throws "Invalid buffer id".
  -- Drop diagnostics for wiped buffers before that handler can read them.
  {
    "folke/snacks.nvim",
    optional = true,
    init = function()
      local purging = false
      vim.api.nvim_create_autocmd("DiagnosticChanged", {
        group = vim.api.nvim_create_augroup("snacks_stale_diagnostics", { clear = true }),
        callback = function()
          if purging then
            return
          end
          purging = true
          local seen = {}
          for _, diag in ipairs(vim.diagnostic.get()) do
            local buf = diag.bufnr
            if buf and not seen[buf] and not vim.api.nvim_buf_is_valid(buf) then
              seen[buf] = true
              pcall(vim.diagnostic.reset, nil, buf)
            end
          end
          purging = false
        end,
      })
    end,
  },
}
