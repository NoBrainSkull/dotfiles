local cmp = require('cmp')
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""



cmp.setup({
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
		['<C-j>'] = cmp.mapping(function(fallback)
			cmp.mapping.abort()
			local copilot_keys = vim.fn["copilot#Accept"]()
			if copilot_keys ~= "" then
				vim.api.nvim_feedkeys(copilot_keys, "i", true)
			else
				fallback()
			end
		end
	)}),
	sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'path' },
			{ name = 'nvim_lua' },
			{ name = 'vsnip' },
			{ name = 'calc' },
		},
		{ name = 'buffer' }
	)
})

cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})
