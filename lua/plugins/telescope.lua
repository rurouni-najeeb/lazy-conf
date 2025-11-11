return {
  "nvim-telescope/telescope.nvim",
  keys = { -- add a keymap to browse plugin files
    -- stylua: ignore
    {
      "<leader>fH",
      function()
        require("telescope.builtin").find_files({ 
          cwd = vim.fn.expand("~"),
          hidden = true,
          follow = true,
          no_ignore = true,
        })
      end,
      desc = "Find Files in Home Directory",
    },
    -- Search all files including hidden ones in current project
    {
      "<leader>fA",
      function()
        require("telescope.builtin").find_files({
          hidden = true,
        })
      end,
      desc = "Find All Files (including hidden)",
    },
    -- Search only Git-tracked files (including hidden)
    {
      "<leader>fG",
      function()
        require("telescope.builtin").git_files({
          show_untracked = true,
        })
      end,
      desc = "Find Git Files (including untracked)",
    },
    -- Find git-ignored files
    {
      "<leader>fi",
      function()
        require("telescope.builtin").find_files({
          hidden = true,
          no_ignore = true,
        })
      end,
      desc = "Find Git-ignored Files",
    },
    -- Live grep including hidden files
    {
      "<leader>sA",
      function()
        require("telescope.builtin").live_grep({
          additional_args = function()
            return { "--hidden" }
          end,
        })
      end,
      desc = "Search in All Files (including hidden)",
    },
  },
  -- change some options
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        i = {
          ["<C-j>"] = "move_selection_next",
          ["<C-k>"] = "move_selection_previous",
        },
      },
      file_ignore_patterns = {
        "%.git/",
        "node_modules/",
        "%.DS_Store",
        ".venv/",
        ".mypy_cache/",
        "__pycache__/",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
      live_grep = {
        additional_args = function()
          return { "--hidden" }
        end,
      },
      git_files = {
        show_untracked = true,
      },
    },
  },
}
