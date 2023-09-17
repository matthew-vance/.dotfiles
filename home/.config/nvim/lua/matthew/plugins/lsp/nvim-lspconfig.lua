return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    servers = {
      astro = {},
      bashls = {},
      gopls = {},
      html = {},
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
      svelte = {},
      terraformls = {},
      tsserver = {},
    },
  },
  config = function(_, opts)
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local mason_lspconfig = require("mason-lspconfig")

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_nvim_lsp.default_capabilities(),
      opts.capabilities or {}
    )

    local servers = opts.servers

    local function setup(server)
      local lspconfig = require("lspconfig")
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      lspconfig[server].setup(server_opts)
    end

    local ensure_installed = {}

    for server in pairs(servers) do
      ensure_installed[#ensure_installed + 1] = server
    end

    mason_lspconfig.setup({
      ensure_installed = ensure_installed,
      handlers = { setup },
      automatic_installation = true,
    })
  end,
}
