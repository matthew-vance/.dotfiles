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

    return {
      sources = {
        d.eslint,
        d.hadolint,
        d.shellcheck,
        d.zsh,

        f.beautysh,
        f.eslint,
        f.gofmt,
        f.prettier,
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
              })
            end,
          })
        end
      end,
    })
  end,
}
