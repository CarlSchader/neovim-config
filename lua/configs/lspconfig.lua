-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- CARL look here for valid servers
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local servers = {
  "html",
  "cssls",
  "rust_analyzer",
  "pyright",
  "ts_ls",
  "sourcekit",
  "nixd",
  "ccls",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  vim.lsp.enable(lsp)
end
