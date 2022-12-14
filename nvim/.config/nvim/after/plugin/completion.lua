local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	window = {},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping.confirm({select = true}),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' }
	},
		{ name = 'buffer' }
	)
})

cmp.setup.cmdline({ '/'; '?'}, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{name = 'buffer'}
	}
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{name='path'}
	}, {
		{name='cmdline'}
	})
})
