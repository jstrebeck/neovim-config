-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "terraformls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

require'lspconfig'.terraformls.setup{
  on_attach = nvlsp.on_attach, -- Keep the NVChad default on_attach
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    terraformls = {
      -- This is the crucial part where you define the code action on save
      lsp_code_actions_on_save = {
        ["source.formatAll.terraform"] = true,
      },
    },
  },
}

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
