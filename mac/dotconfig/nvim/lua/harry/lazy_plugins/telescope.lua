return {
	'nvim-telescope/telescope.nvim',

	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>G', builtin.git_files, {})
		vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
		vim.keymap.set('n', '<leader>ws', ":Telescope lsp_dynamic_workspace_symbols<CR>", {})
	end
}
