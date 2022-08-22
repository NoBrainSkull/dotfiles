return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Catppuccin !
  use { "catppuccin/nvim", as = "catppuccin" }
end)
