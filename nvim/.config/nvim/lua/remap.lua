local module = {}
local nnoremap = require("keymaps").nnoremap
local inoremap = require("keymaps").inoremap

-- <leader> key
vim.g.mapleader = ' '

-- Block arrow keys
nnoremap('<Left>', '<Nop>')
nnoremap('<Up>', '<Nop>')
nnoremap('<Right>', '<Nop>')
nnoremap('<Down>', '<Nop>')

-- jk escape
inoremap('jk', '<Esc>')
  
-- Telescope
nnoremap('<leader>ff', ':Telescope find_files<cr>')
nnoremap('<leader>fg', ':Telescope live_grep<cr>')
nnoremap('<leader>fb', ':Telescope buffers<cr>')
nnoremap('<leader>fe', ':Telescope file_browser<cr>')

-- LSP Mapping
function module.custom_attach(client, bufnr)
  local opts = { silent = true, buffer = bufnr }

  nnoremap('gd', vim.lsp.buf.definition, opts)
  nnoremap('gr', vim.lsp.buf.references, opts)
  nnoremap('gep', vim.diagnostic.goto_prev, opts)
  nnoremap('gen', vim.diagnostic.goto_next, opts)
  nnoremap('<C-h>', vim.lsp.buf.signature_help, opts)
  nnoremap('<leader>rn', vim.lsp.buf.rename, opts)
  nnoremap('<leader>ca', vim.lsp.buf.code_action, opts)

  if client.name == 'rust-tools' then
    nnoremap('H', ':RustHoverActions', opts)
  else
    nnoremap('H', vim.lsp.buf.hover, opts)
  end

  if client.resolved_capabilities.document_formatting then
    nnoremap('gf', vim.lsp.buf.formatting_sync, opts)
  end
end

return module
