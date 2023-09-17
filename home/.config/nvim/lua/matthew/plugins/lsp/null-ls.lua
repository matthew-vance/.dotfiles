return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "mason.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local null_ls = require("null-ls")

    local d = null_ls.builtins.diagnostics
    local f = null_ls.builtins.formatting
    local ca = null_ls.builtins.code_actions

    return {
      sources = {
        d.eslint_d,
        d.zsh,

        ca.eslint_d,

        f.beautysh,
        f.eslint_d,
        f.prettierd,
        f.stylua,
      },
    }
  end,
}
