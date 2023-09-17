return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  opts = {
    ensure_installed = {
      "beautysh",
      "eslint_d",
      "prettierd",
      "stylua",
    },
    automatic_installation = true,
  },
  config = function(_, opts)
    local mason = require("mason")
    local mason_registry = require("mason-registry")

    local function ensure_installed()
      for _, package in ipairs(opts.ensure_installed) do
        local p = mason_registry.get_package(package)
        if not p:is_installed() then
          p:install()
        end
      end
    end

    mason.setup(opts)

    if mason_registry.refresh then
      mason_registry.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
