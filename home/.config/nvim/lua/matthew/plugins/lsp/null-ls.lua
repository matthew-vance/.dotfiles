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
        f.gofmt,
        f.prettierd,
        f.stylua,
      },
    }
  end,
  config = function(_, opts)
    local null_ls = require("null-ls")

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = opts.sources,
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                async = false,
                filter = function()
                  return client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end,
}
