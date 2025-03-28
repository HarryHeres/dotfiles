return {
	'mfussenegger/nvim-jdtls',
	name = 'jdtls',

	config = function()
		local jdtls = require('jdtls')
		local java_cmds = vim.api.nvim_create_augroup('java_cmds', { clear = true })
		local project_dir = vim.fn.expand('~/.local/share/nvim/jdtls_projects')

		local java_formatter = vim.fn.expand('~/Projects/Templates/java_formatter.xml')
		local java_debug = vim.fn.expand('~/.local/share/nvim/mason/packages/java-debug-adapter')
		local java21_home = '/opt/homebrew/Cellar/openjdk@21/21.0.6'
		local java17_home = '/opt/homebrew/Cellar/openjdk@17/17.0.14'

		local java_settings_prefs_path = vim.fn.expand('~/Projects/Templates/settings.prefs')

		-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
		local config = {
			-- The command that starts the language server
			-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
			cmd = {
				java17_home .. '/bin/java/',
				'-Declipse.application=org.eclipse.jdt.ls.core.id1',
				'-Dosgi.bundles.defaultStartLevel=4',
				'-Declipse.product=org.eclipse.jdt.ls.core.product',
				'-Dlog.protocol=true',
				'-Dlog.level=ALL',
				'-Dorg.eclipse.jdt.core.compiler.problem.missingSerialVersion=warning',
				'-Xmx4g',
				'--add-modules=ALL-SYSTEM',
				'--add-opens', 'java.base/java.util=ALL-UNNAMED',
				'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
				'-jar',
				vim.fn.expand(
					'~/Projects/Tools/Neovim/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar'),
				'-configuration',
				vim.fn.expand(
					'~/Projects/Tools/Neovim/jdtls/config_mac_arm/'),
				'-data', project_dir
			},

			-- 💀
			-- This is the default if not provided, you can remove it. Or adjust as needed.
			-- One dedicated LSP server & client will be started per unique root_dir
			root_dir = vim.fs.root(0, { "mvnw", "pom.xml" }),

			on_attach = function(client, bufrn)
				jdtls.setup_dap({ hotcodereplace = 'auto' })
			end,

			-- Here you can configure eclipse.jdt.ls specific settings
			-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
			-- for a list of options
			settings = {
				java = {
					settings = {
						url = java_settings_prefs_path,
					},

					signatureHelp = {
						enabled = 'true'
					},

					configuration = {
						runtimes = {
							{
								name = "JavaSE-21",
								path = java21_home .. '/'
							},
							{
								name = "JavaSE-17",
								path = java17_home .. '/'
							},
							{
								name = "JavaSE-11",
								path = '/opt/homebrew/Cellar/openjdk@11/11.0.26/'
							},
						},
					},

					saveActions = {
						organizeImports = 'true',
					},

					sources = {
						organizeImports = {
							starThreshold = 9999,
							staticStarThreshold = 9999
						}
					},

					import = {
						maven = {
							enabled = 'false',
						},
						exclusions = {
							"**/node_modules/**",
							"**/.metadata/**",
							"**/archetype-resources/**",
							"**/META-INF/maven/**",
							"/**/test/**"
						}
					},

					format = {
						enabled = 'true',
						settings = {
							url = java_formatter,
						},
						-- comments = {
						--     enabled = 'false',

						--     insertSpaces = 'true',
						--     onType = 'true',
						--     tabSize = 4
						-- }
					},

					cleanup = {
						addOverride = '@Override',
						addDeprecated = '@Deprecated',
						addFinalModifier = 'final',
					}
				},

			},

			-- Language server `initializationOptions`
			-- You need to extend the `bundles` with paths to jar files
			-- if you want to use additional eclipse.jdt.ls plugins.
			--
			-- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
			--
			-- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
			init_options = {
				bundles = {
					vim.fn.glob(java_debug .. "/extension/server/com.microsoft.java.debug.plugin-*.jar", 1),
				}
			},
		}

		-- This starts a new client & server,
		-- or attaches to an existing client & server depending on the `root_dir`.
		-- print("Setting up JDTLS...")
		-- jdtls.start_or_attach(config)

		local function jdtls_setup(event)
			jdtls.start_or_attach(config)
		end

		vim.api.nvim_create_autocmd('FileType', {
			group = java_cmds,
			pattern = { 'java' },
			desc = 'Setup JDTLS',
			callback = jdtls_setup,
		})
	end
}
