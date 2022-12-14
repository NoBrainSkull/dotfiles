local nnoremap = require("nobrainskull.keymap").nnoremap
local inoremap = require("nobrainskull.keymap").inoremap

-- File explorer (netrw)
nnoremap("<leader>fe", "<cmd>Ex<CR>")

-- Block arrow keys
nnoremap('<Left>', '<Nop>')
nnoremap('<Up>', '<Nop>')
nnoremap('<Down>', '<Nop>')
nnoremap('<Right>', '<Nop>')
inoremap('<Left>', '<Nop>')
inoremap('<Up>', '<Nop>')
inoremap('<Down>', '<Nop>')
inoremap('<Right>', '<Nop>')

-- Escape shortcut
inoremap('jk', '<C-c>')

-- Telescope
nnoremap('<leader>ff', '<Cmd>Telescope find_files<CR>')
nnoremap('<leader>fg', '<Cmd>Telescope live_grep<CR>')
nnoremap('<leader>fb', '<Cmd>Telescope buffers<CR>')

