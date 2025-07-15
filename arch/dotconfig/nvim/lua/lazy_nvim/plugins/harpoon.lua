return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	commit = "e76cb03",

	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
}
