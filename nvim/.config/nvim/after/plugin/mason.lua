local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local bind = require("nobrainskull.keymap").bind
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local notify = require("notify")
local rt = require("rust-tools")
local lsp_config = require("lspconfig")

vim.o.completeopt = "menuone,noinsert,noselect"

local on_attach = function(client, bufnr)
	local nnoremap = bind('n', { noremap = true, silent = true, buffer = bufnr })


	if client.name == "rust_analyzer" then
		notify("loading rust config")
		-- Hover actions
		nnoremap("<C-space>", rt.hover_actions.hover_actions)
		-- Code action groups
		nnoremap("<Leader>a", rt.code_action_group.code_action_group)
	else
		nnoremap("gD", vim.lsp.buf.declaration)
		nnoremap("gd", vim.lsp.buf.definition)
		nnoremap("<leader>H", vim.lsp.buf.hover)
		nnoremap("gi", vim.lsp.buf.implementation)
		nnoremap("<leader>S", vim.lsp.buf.signature_help)
		nnoremap("<leader>D", vim.lsp.buf.type_definition)
		nnoremap("<leader>rn", vim.lsp.buf.rename)
		nnoremap("<leader>ca", vim.lsp.buf.code_action)
		nnoremap("<leader>gr", vim.lsp.buf.references)
		nnoremap("<leader>F", function() vim.lsp.buf.format { async = true } end)
	end
end

mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers {
	function(server_name)
		lsp_config[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach
		}
	end
}

lsp_config.elixirls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "elixir-ls" }
}

lsp_config.tailwindcss.setup {
	on_attach = on_attach,
	filetypes = { "html", "elixir", "eelixir", "heex" },
	root_dir = lsp_config.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git', 'mix.exs'),
	init_options = {
		userLanguages = {
			elixir = "html-eex",
			eelixir = "html-eex",
			heex = "html-eex",
		},
	},
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					'class[:]\\s*"([^"]*)"',
				},
			},
		},
	},
}

lsp_config.emmet_ls.setup{
  capabilities = capabilities,
	on_attach = on_attach,
  filetypes = { "html", "css", "elixir", "eelixir", "heex" },
}

rt.setup({
	server = {
		on_attach = on_attach,
		standalone = true,
	},
})
