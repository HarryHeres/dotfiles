return {
	"sainnhe/gruvbox-material",
	priority = 999,
	config = function()
		vim.g.gruvbox_material_foreground = "original"
		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_diagnostic_virtual_text = "highlighted"

		vim.cmd.colorscheme("gruvbox-material")
	end,
}
