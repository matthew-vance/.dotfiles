return {
  {
    "echasnovski/mini.nvim",
    lazy = false,
    config = function()
      require("mini.ai").setup()
      require("mini.bracketed").setup()
      require("mini.comment").setup()
      require("mini.cursorword").setup()
      require("mini.files").setup()
      require("mini.icons").setup()
      require("mini.move").setup()
      require("mini.pairs").setup()
      require("mini.sessions").setup()
      require("mini.statusline").setup()
      require("mini.surround").setup({
        mappings = {
          add = "gza", -- Add surrounding in Normal and Visual modes
          delete = "gzd", -- Delete surrounding
          find = "gzf", -- Find surrounding (to the right)
          find_left = "gzF", -- Find surrounding (to the left)
          highlight = "gzh", -- Highlight surrounding
          replace = "gzr", -- Replace surrounding
          update_n_lines = "gzn", -- Update `n_lines`
        },
      })
    end,
    keys = {
      {
        "<leader>fe",
        function()
          require("mini.files").open()
        end,
        desc = "Open file explorer",
      },
    },
  },
}
