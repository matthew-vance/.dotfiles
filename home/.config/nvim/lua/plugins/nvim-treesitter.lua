return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "vim",
          "lua",
          "python",
          "javascript",
          "typescript",
          "html",
          "css",
          "go",
          "terraform",
          "c_sharp",
          "dockerfile",
          "bash"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
