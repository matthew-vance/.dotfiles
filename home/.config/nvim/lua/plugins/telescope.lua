return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    lazy = false,
    dependencies = {
      "plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-web-devicons",
    },
    keys = function()
      local builtin = require("telescope.builtin")
      return {
        { "<leader>,",       builtin.buffers,                    desc = "Switch Buffer" },
        { "<leader>/",       builtin.live_grep,                  desc = "Grep (root dir)" },
        { "<leader>:",       builtin.command_history,            desc = "Command History" },
        { "<leader>fw",      builtin.grep_string,                desc = "Word (root dir)" },
        { "<leader><space>", builtin.find_files,                 desc = "Find Files (root dir)" },
        { "<leader>ff",      builtin.find_files,                 desc = "Find Files (root dir)" },
        { "<leader>f?",      builtin.help_tags,                  desc = "Search Help" },
        { "<leader>fh",      "<cmd>Telescope harpoon marks<cr>", desc = "Find Files (harpoon)" },
      }
    end,
    opts = function()
      local actions = require("telescope.actions")
      return {
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-h>"] = "which_key",
              ["<C-x>"] = actions.delete_buffer,
            },
          },
          file_ignore_patterns = { ".git" },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        }
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")

      telescope.load_extension("fzf")
      telescope.load_extension("harpoon")
      telescope.setup(opts)
    end,
  },
}
