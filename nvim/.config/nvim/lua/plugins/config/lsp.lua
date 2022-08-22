-- 
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
  return
end

-- Language Server Protocol
-- This file is configuring the client part. The server part is installed on the system, to do so, you have
--
-- 2 choices :
-- Installing as a plugin : the easy way but you may end up with several instances of the server running at once, 
--  eatinup all your RAM
--
-- Installing on you system : still easy through AUR if you run arch. Should run 1 instance only.

-- I mutualized mapping for the on_attach callback
local keymaps = require('keymaps')
local lspconfig = require('lspconfig')
local cmp = require('cmp')

-- ELIXIR
--if vim.executable('elixir') then
  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

  lspconfig.elixirls.setup {
    cmd = { "/home/no_brain_skull/src/elixir-ls/release/language_server.sh" },
    on_attach = keymaps.custom_attach,
    capabilities = capabilities
  }
--end

-- TYPESCRIPT
lspconfig.tsserver.setup {
  on_attach = keymaps.custom_attach,
  filetypes = { "typescript", "typescript.tsx", "typescriptvue" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- PYTHON
require'lspconfig'.pyright.setup{
  on_attach = keymaps.custom_attach
}

-- LUA
lspconfig.sumneko_lua.setup {
  on_attach = keymaps.custom_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

-- RUST
require('rust-tools').setup {
  tools = {
    autoSetHints = true,
    runnables = {
      use_telescope = true
    },
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    on_attach = keymaps.custom_attach
  }
}
