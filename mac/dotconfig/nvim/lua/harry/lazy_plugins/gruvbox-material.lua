return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_foreground = "original"
		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"

		-- This needs to be the last
		vim.cmd.colorscheme "gruvbox-material"
	end,
}
