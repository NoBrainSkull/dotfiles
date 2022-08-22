local module = {}

-- <leader> key
vim.g.mapleader = ' '

-- Helper function
local default_options = { noremap=true }

function map(mode, lhs, rhs, opts)
  local options = default_options

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

-- Keyboard shortcuts
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fb', ':Telescope buffers<cr>')
map('n', '<leader>fe', ':Telescope file_browser<cr>')

-- LSP Mapping
function module.custom_attach(client, bufnr)
  local opts = { silent = true, buffer = bufnr }
  require('notify')('on_attach fired')

  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'gr', vim.lsp.buf.references, opts)
  map('n', 'gep', vim.diagnostic.goto_prev, opts)
  map('n', 'gen', vim.diagnostic.goto_next, opts)
  map('n', '<C-h>', vim.lsp.buf.signature_help, opts)
  map('n', '<leader>rn', vim.lsp.buf.rename, opts)
  map('n', '<leader>ca', vim.lsp.buf.code_action, opts)

  if client.name == 'rust-tools' then
    map('n', 'H', ':RustHoverActions', opts)
  else
    map('n', 'H', vim.lsp.buf.hover, opts)
  end

  if client.resolved_capabilities.document_formatting then
    map('n', 'gf', vim.lsp.buf.formatting_sync, opts)
  end
end

return module
