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

-- Moving selected lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Replace with clipboard 
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>l", "<cmd>! yarn lint --fix %<CR>")

-- replace current word
vim.keymap.set('n', '<leader>s', ":%s/\\<<C-R><C-w>\\>/<C-R><C-w>/gI<Left><Left><Left>")
