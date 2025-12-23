local java_home = vim.fn.expand("~/.sdkman/candidates/java/21.0.7-tem/")

local project_root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]) or vim.fn.getcwd()
local jdtls_root_dir = vim.fs.dirname(vim.fs.find({ "pom.xml" })[1], { upward = false }) or project_root_dir
local jdtls_data_dir = project_root_dir .. "/.nvim/java/jdtls"

local formatter_path = project_root_dir .. "/.nvim/java/formatter.xml"
local java_settings_prefs_path = vim.fn.expand("~/Projects/Templates/settings.prefs")

return {
	cmd = {
		java_home .. "bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Dorg.eclipse.jdt.core.compiler.problem.missingSerialVersion=warning",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		vim.fn.expand(
			"~/Projects/Tools/Neovim/jdtls/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar"
		),
		"-configuration",
		vim.fn.expand(
			"~/Projects/Tools/Neovim/jdtls/config_linux/"
		),
		"-data",
		jdtls_data_dir,
	},

	filetypes = { 'java' },
	root_dir = jdtls_root_dir,
	settings = {
		java = {
			settings = {
				url = java_settings_prefs_path,
			},

			signatureHelp = {
				enabled = "true",
			},

			configuration = {
				runtimes = {},
			},

			saveActions = {
				organizeImports = "true",
			},

			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},

			import = {
				maven = {
					enabled = "false",
				},
				exclusions = {
					"**/node_modules/**",
					"**/.metadata/**",
					"**/archetype-resources/**",
					"**/META-INF/maven/**",
					"/**/test/**",
				},
			},

			format = {
				enabled = "true",
				settings = {
					url = formatter_path,
				},
			},

			cleanup = {
				addOverride = "@Override",
				addDeprecated = "@Deprecated",
				addFinalModifier = "final",
			},
		},
	},

	init_options = {
		bundles = {
			vim.fn.glob(
				"~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
				1
			),
		},
	},
}
