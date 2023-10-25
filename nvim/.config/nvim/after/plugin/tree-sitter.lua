local ts_conf = require("nvim-treesitter.configs")

ts_conf.setup {
	auto_install = true,
	sync_install = false,
	autotag = {
		enable = true,
		filetypes = {
			'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
			'rescript',
			'xml',
			'php',
			'markdown',
			'astro', 'glimmer', 'handlebars', 'hbs',
			'ex'
		}
	},
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false
	},
	indent = {
		enable=true
	}
}
