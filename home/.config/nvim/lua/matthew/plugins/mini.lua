return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
      require("mini.pairs").setup()
      require("mini.comment").setup()
      require("mini.indentscope").setup()
      require("mini.cursorword").setup()
      require("mini.move").setup()
      require("mini.starter").setup({
        header = function()
          local header = vim.fn.system("figlet -f slant 'neovim'")
          local fortune = vim.fn.system("fortune -s -n 280")
          return header .. "\n" .. fortune
        end,
      })

      require("mini.animate").setup({
        scroll = {
          enable = false,
        },
      })

      local clue = require("mini.clue")
      clue.setup({
        triggers = {
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },
          { mode = "i", keys = "<C-x>" },
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },
          { mode = "n", keys = "<C-w>" },
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },
        clues = {
          clue.gen_clues.builtin_completion(),
          clue.gen_clues.g(),
          clue.gen_clues.marks(),
          clue.gen_clues.registers(),
          clue.gen_clues.windows(),
          clue.gen_clues.z(),
          { mode = "n", keys = "<Leader>f", desc = "+Find" },
          { mode = "n", keys = "<Leader>h", desc = "+Harpoon" },
          { mode = "n", keys = "<Leader>x", desc = "+Trouble" },
          { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
        },
      })

      require("mini.files").setup({
        windows = {
          preview = true,
          width_focus = 30,
          width_preview = 30,
        },
      })

      require("mini.surround").setup({
        mappings = {
          add = "gsa",
          delete = "gsd",
          find = "gsf",
          find_left = "gsF",
          highlight = "gsh",
          replace = "gsr",
          update_n_lines = "gsn",
        },
      })

      require("mini.bufremove").setup()
    end,
    keys = function()
      local mini_files = require("mini.files")
      local mini_bufremove = require("mini.bufremove")

      local mini_files_toggle = function()
        if not mini_files.close() then
          mini_files.open()
        end
      end

      return {
        {
          "<leader>'",
          function()
            mini_files_toggle()
          end,
          desc = "Toggle file browser",
        },
        {
          "<leader>bd",
          function()
            mini_bufremove.delete(0, false)
          end,
          desc = "Delete buffer",
        },
        {
          "<leader>bD",
          function()
            mini_bufremove.delete(0, true)
          end,
          desc = "Delete buffer (force)",
        },
      }
    end,
  },
}
