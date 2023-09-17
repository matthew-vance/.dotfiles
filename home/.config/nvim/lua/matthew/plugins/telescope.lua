return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  keys = function()
    local builtin = require("telescope.builtin")
    return {
      { "<leader><space>", builtin.find_files, desc = "Find files" },
      { "<leader>ff", builtin.find_files, desc = "Find files" },
      { "<leader>f,", builtin.buffers, desc = "Find buffer" },
      { "<leader>f/", builtin.live_grep, desc = "Find in files" },
      { "<leader>fw", builtin.grep_string, desc = "Find word" },
      { "<leader>f?", builtin.help_tags, desc = "Find in help" },
    }
  end,
  opts = function()
    local actions = require("telescope.actions")
    local telescopeConfig = require("telescope.config")
    local vimgrep_arguments = { telescopeConfig.values.vimgrep_arguments }

    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    return {
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
        vimgrep_arguments = vimgrep_arguments,
        file_ignore_patterns = { ".git/*", "node_modules/*" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.load_extension("fzf")
    telescope.setup(opts)
  end,
}
