local bin_name = 'marksman'
local cmd = { bin_name, 'server' }

return {
	cmd = cmd,
	filetypes = { 'markdown', 'markdown.mdx', 'md' },
	root_markers = { '.marksman.toml', '.git' },
	sigle_file_support = true
}
