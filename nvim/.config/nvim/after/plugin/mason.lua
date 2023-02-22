local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local bind = require("nobrainskull.keymap").bind
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
	local nnoremap = bind('n', {noremap=true, silent=true, buffer=bufnr})

	nnoremap("gD", vim.lsp.buf.declaration)
	nnoremap("gd", vim.lsp.buf.definition)
	nnoremap("<leader>H", vim.lsp.buf.hover)
	nnoremap("gi", vim.lsp.buf.implementation)
	nnoremap("<leader>S", vim.lsp.buf.signature_help)
	nnoremap("<leader>D", vim.lsp.buf.type_definition)
	nnoremap("rn", vim.lsp.buf.rename)
	nnoremap("<leader>ca", vim.lsp.buf.code_action)
	nnoremap("<leader>gr", vim.lsp.buf.references)
	nnoremap("<leader>F", function() vim.lsp.buf.format { async = true } end)
end

mason.setup()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers {
	function(server_name)
		require("lspconfig")[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach
		}
	end
}

