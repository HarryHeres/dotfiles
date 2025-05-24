local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
	"force",
	{},
	vim.lsp.protocol.make_client_capabilities(),
	cmp_lsp.default_capabilities()
)


capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config('*', {
	capabilities = capabilities
})
