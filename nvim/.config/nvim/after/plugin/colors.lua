local catp = require("catppuccin")
vim.cmd("colorscheme catppuccin-mocha")

catp.setup {
	integrations = {
		mason = true,
		markdown = true,
		telescope = true,
		cmp = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},

		},
		treesitter = true,
		treesitter_context = true,
		notify = true,
		which_key = true
	}
}

