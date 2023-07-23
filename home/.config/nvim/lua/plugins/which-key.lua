return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    config = function()
      local wk = require("which-key")

      wk.register({
        ["<leader>"] = {
          f = { name = "+find" },
          x = { name = "+diagnostics/quickfix" },
          e = { name = "+explorer" },
        },
      })
    end,
  },
}
