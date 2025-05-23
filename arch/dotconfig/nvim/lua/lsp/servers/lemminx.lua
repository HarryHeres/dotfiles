return {
	settings = {
		xml = {
			trace = {
				server = "verbose",
			},
			logs = {
				client = true,
				file = vim.fn.expand("~/.local/state/nvim/lsp4xml.log")
			},
			format = {
				enabled = true,
				splitAttributes = false,
				joinCDATALines = false,
				joinContentLines = false,
				joinCommentLines = false,
				spaceBeforeEmptyCloseTag = false
			}
		}
	}
}
