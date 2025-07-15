return {
	'stevearc/conform.nvim',

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" }
			},

			format_on_save = {
				timeout_ms = 200,
				lsp_format = "last",
			},
		})
	end
}
