vim.g.mapleader = " "

-- lines display
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.numberwidth = 6
vim.opt.showtabline=0
vim.opt.title=true
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.startofline=true
vim.opt.hidden=true
vim.opt.scrolloff=8
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@") 

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "160"

-- search
vim.opt.incsearch=true
vim.opt.hlsearch=true

-- tabs are spaces
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.softtabstop=2
vim.opt.expandtab=false

-- persistance 
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.smartindent=true

vim.opt.wrap=false

vim.opt.fileencoding='utf-8'
