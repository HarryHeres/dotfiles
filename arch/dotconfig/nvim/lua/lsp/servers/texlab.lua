local forward_search_args = {
	'--reuse-window',
	-- '--execute-command', 'toggle_synctex', -- Open Sioyek in synctex mode.
	-- '--inverse-search',
	-- [[nvim-texlabconfig -file %%%1 -line %%%2 -server ]] .. vim.v.servername,
	'--forward-search-file', '%f',
	'--forward-search-line', '%l', '%p'
}

local pdf_executable = 'sioyek'

return {
	filetypes = { "tex", "plaintex", "bib" },

	settings = {
		texlab = {
			build = {
				pdfDirectory = "build",
				args = { "-cd", "-pdf", "-shell-escape", "-auxdir=build", "-outdir=build", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
				forwardSearchAfter = false,
				onSave = true
			},

			forwardSearch = {
				executable = pdf_executable,
				args = forward_search_args
			}
		}
	}

}
