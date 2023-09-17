return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
      },
    })
  end,
}
