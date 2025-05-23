local pid = vim.fn.getpid()
local omnisharp_bin = "/home/harry/.local/share/nvim/mason/bin/omnisharp"

return {
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },

	enable_editorconfig_support = true,

	enable_import_completion = true,
	organize_imports_on_format = true
}
