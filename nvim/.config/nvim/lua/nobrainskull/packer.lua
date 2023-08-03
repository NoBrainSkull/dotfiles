vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Package manager
	use 'wbthomason/packer.nvim'

	-- Extend vim-lua
	use { "nvim-lua/plenary.nvim" }

	-- Colorscheme
	use { "catppuccin/nvim", as = "catppuccin" }

	-- Tooling manager (LSP, DAP, Linters, etc.)
	use { "williamboman/mason.nvim" }
	use "williamboman/mason-lspconfig.nvim"
	use 'neovim/nvim-lspconfig'

	-- Navigation
	use { "nvim-telescope/telescope-fzf-native.nvim",
		run =
		'cmake -S? -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build --config Release && cmake --install build --prefix build'
	}
	use { "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } }
	use('mbbill/undotree')


	-- GUI
	use { "mhinz/vim-signify", event = "BufEnter" }
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	})
	use({ "APZelos/blamer.nvim" })
	use 'rcarriga/nvim-notify'
	use({
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  })


	-- Completion
	use { "folke/which-key.nvim", config = function ()
		vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {}
	end}
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-cmdline" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/vim-vsnip" }
	use { "hrsh7th/vim-vsnip-integ" }
	use { "hrsh7th/cmp-vsnip" }
	use { "windwp/nvim-ts-autotag", run= function()
		require('nvim-ts-autotag').setup()
	end}
	use { "nvim-treesitter/nvim-treesitter", 
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end
	}
	use { "windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	-- Rust tools
	use 'simrat39/rust-tools.nvim'
	use { 'nvim-orgmode/orgmode', config = function()
		require('orgmode').setup {}
	end
	}
end)
