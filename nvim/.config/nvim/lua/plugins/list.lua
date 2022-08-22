return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Catppuccin ! The delicious colorscheme
  use { "catppuccin/nvim", as = "catppuccin" }
  -- Neovim-Lua basic helpers
  use { 'nvim-lua/plenary.nvim' }
  

  -- UI Plugins
  -- Notification system
  use { 'rcarriga/nvim-notify' }
  use { 'kyazdani42/nvim-web-devicons' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = [[require('plugins.config.lualine')]]
  }
  use { 'windwp/nvim-autopairs', config = [[ require('plugins.config.autopairs') ]] }
  use { 'windwp/nvim-ts-autotag', config = [[ require('plugins.config.autotags') ]] }
  use { 'norcalli/nvim-colorizer.lua' }
  use { 'lewis6991/gitsigns.nvim', run = function() vim.fn['gitsigns#setup']({}) end }
  use { 'dinhhuy258/git.nvim' }
  use { 'iamcco/markdown-preview.nvim' }
  use { 'folke/which-key.nvim', config = function()
    require'which-key'.setup {}
  
  end}
  -- Telescope
  --
  -- I use it to navigate between files, creating/renaming files/fodlers, explore git changes, find in file,
  -- find in project , etc. 
  --
  -- Telescope is a framework to pick items from a list. Items are listed through `pickers`, sorted with `sorter` (see dep above).
  -- A bunch of default picker come included in Telescope, others can be added through its highly
  -- extendable system.
  --
  -- Strongly recommended for perfomances : install `ripgrep` and `fd` on your system

  -- Telescope FZF sorter (a sorter for Telescope, see below)
  use {'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {'nvim-telescope/telescope.nvim', 
    tag = '0.1.0', 
    requires = { {'nvim-lua/plenary.nvim'} } }
  use {'nvim-telescope/telescope-file-browser.nvim',
    requires = { { 'nvim-telescope/telescope.nvim' } }}



  -- Git
  -- Show git change (change, delete, add) signs in vim sign column
  use({"mhinz/vim-signify", event = 'BufEnter'})



  -- Languages
  -- Using nvim builtin lsp client to use Language Server Protocols
  
  -- Add icons to type completions
  use({"onsails/lspkind-nvim", event = "VimEnter"})
  -- auto-completion engine
  use {"hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('plugins.config.cmp')]]}

  -- nvim-cmp completion sources
  use {"hrsh7th/cmp-nvim-lsp", after = "nvim-cmp"}
  use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
  use {"hrsh7th/cmp-path", after = "nvim-cmp"}
  use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
  use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
  use {"hrsh7th/cmp-cmdline", after = "nvim-cmp"}
  use {"hrsh7th/cmp-emoji", after = 'nvim-cmp'}
  -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
  use({ "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('plugins.config.lsp')]] })
  -- Add vscode like code snippets
  use({"hrsh7th/cmp-vsnip", after = "cmp-nvim-lsp"})
  use({"hrsh7th/vim-vsnip-integ"})
  use({"hrsh7th/vim-vsnip"})
  -- AST parsing and syntax colorization
  use({'nvim-treesitter/nvim-treesitter', run=":TSUpdate", config= [[require('plugins.config.treesitter')]]})
  -- Rust 
  use { 'simrat39/rust-tools.nvim' }
  -- Typescript
  use { 'jose-elias-alvarez/typescript.nvim' }
  use { 'jose-elias-alvarez/null-ls.nvim' }
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
}})

