return {
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.pairs").setup()
      require("mini.comment").setup()
      require("mini.cursorword").setup()
      require("mini.starter").setup({
        header = function()
          local header = vim.fn.system("figlet -f larry3d 'neovim'")
          local fortune = vim.fn.system("fortune")
          return header .. "\n" .. fortune
        end,
      })
      require("mini.indentscope").setup()
      require("mini.animate").setup({
        scroll = {
          enable = false,
        },
      })
      require("mini.jump").setup()
      require("mini.bracketed").setup()
      require("mini.splitjoin").setup()
      require("mini.trailspace").setup()
    end,
  },
}
