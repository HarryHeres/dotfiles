return {
	'stevearc/conform.nvim',

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				-- python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				-- rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				ruby = { "rubyfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				swift = { "swift_format" }

			},
			formatters = {
				swift_format = {
					command = "swift-format"
				}
			},

			default_format_opts = {
				lsp_format = "fallback",
			},
		})
	end
}
