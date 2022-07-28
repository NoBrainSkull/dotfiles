function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- NAVIGATION
-- Go to the begining and end of current line in insert mode quickly
map('i', '<C-A>', '<HOME>')
map('i', '<C-E>', '<END>')

-- Open link below cursor
map('n', 'gx', '!xdg-open <cfile> <CR>', { silent=true })

-- Convienient way to close the current buffer
map('n', '<leader>q', ":bp<bar> bd# <CR>")

-- Move to the start/end of a line easily
map('n', 'H', '^')
map('x', 'H', '^')
map('n', 'L', 'g_')
map('x', 'L', 'g_')

-- Move the cursor based on phusical lines, not the actual lines
-- map('n', 'j', "(v:count == 0 ? 'gj' : 'j')", { expr = true })
-- map('n', 'j', "(v:count == 0 ? 'gj' : 'k')", { expr = true })
map('n', '^', 'g^')
map('n', '0', 'g0')

-- Move forward/backward buffers
map('n', 'gb', ':bn<cr>')
map('n', '<A-Tab>', ':bn<cr>')
map('n', 'gB', ':bp<cr>')
map('n', '<A-S-Tab>', ':bp<cr>')

-- change window with arrow keys
map('n', '<Left>', '<C-W>h')
map('n', '<Right>', '<C-W>l')
map('n', '<Up>', '<C-W>k')
map('n', '<Down>', '<C-W>j')

--EDITION
-- Delete the character to the right of the cursor
map('i', '<C-D>', '<DEL>')
-- Change text without putting it into the vim register
map('n', 'c', '"_c')
map('n', 'C', '"_C')
map('n', 'cc', '"_cc')
map('x', 'c', '"_c')

-- Turn word to uppercase
map('i', '<C-u>', '<Esc>viwUea')
map('i', '<C-t>', '<Esc>b~lea')

-- Insert a blank line below or above the curosr
map('n', '<Space>o', 'o<Esc>k')
map('n', '<Space>O', 'O<Esc>j')

-- Keep cursor position after yanking
map('n', 'y', 'myy')
map('x', 'y', 'myy')

-- SEARCHING
-- Always use magic searching
map('n', '/', '/\\v')

-- HUD
-- Shortcut for my favorite layout
map('n', '<C-t>', ':vsp enew <cr>')
map('n', '<leader>l', ':vertical resize 30 <cr>')

-- Handle Diagnostic display
map('n', '<space>e', 'vim.diagnostic.open_float')
map('n', '<C-k>', 'vim.diagnostic.goto_prev')
map('n', '<C-j>', 'vim.diagnostic.goto_next')
map('n', '<space>q', 'vim.diagnostic.setloclist')

-- Handle NvimTree
map('n', '<leader>xt', ":NvimTreeToggle <CR>")
map('n', '<leader>xf', ":NvimTreeFindFile <CR>")

-- vsnip keys
map("i", "<C-j>", "vsnip#available(1) ? '<Plug>(vsnip-expand)' : '<C-j>'", {expr = true})
map("s", "<C-j>", "vsnip#available(1) ? '<Plug>(vsnip-expand)' : '<C-j>'", {expr = true})

-- Toggle cursor column
map('n', '<leader>cl', ':<C-U>call utils#ToggleCursorCol()<CR>', {silent=true})

-- Move current line up and down
map('i', '<A-k>', '<Cmd>call utils#SwitchLine(line("."), "up")<CR>')
map('i', '<A-j>', '<Cmd>call utils#SwitchLine(line("."), "down")<CR>')

-- Move current visual selection up and down
map('x', '<A-k>', '<Cmd>call utils#MoveSelection("up")<CR>')
map('x', '<A-j>', '<Cmd>call utils#MoveSelection("down")<CR>')

-- CONFIGURATION
-- Edit and reload init.vim quickly
map('n', '<leader>ev', ':<C-U>tabnew $MYVIMRC <bar> tcd %:h<cr>', { silent=true })
map('n', '<leader>sv', ':<C-U>silent update $MYVIMRC <bar> source $MYVIMRC <bar> call v:lua.vim.notify("Nvim config successfully reloaded!", "info", { "title": "nvim-config" })<cr>', { silent=true })
