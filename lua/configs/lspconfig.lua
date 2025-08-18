-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- CARL look here for valid servers
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local servers = {
  "html",
  "cssls",
  "rust_analyzer",
  "pyright",
  -- "pylsp",
  "ts_ls",
  "sourcekit",
  "nixd",
  "clangd",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
