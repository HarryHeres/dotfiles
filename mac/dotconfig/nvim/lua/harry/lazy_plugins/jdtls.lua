return {
	'mfussenegger/nvim-jdtls',
	name = 'jdtls',

	config = function()
		local jdtls = require('jdtls')
		local java_cmds = vim.api.nvim_create_augroup('java_cmds', { clear = true })
		local project_dir = vim.fn.expand('~/.local/share/nvim/jdtls_projects')

		local java17_home = '/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home/'

		-- JavaFX Runtimes
		local jfx17_home = '/Library/Java/JavaVirtualMachines/liberica-jdk-17-full.jdk/Contents/Home'
		local jfx11_home = '/Library/Java/JavaVirtualMachines/liberica-jdk-11-full.jdk/Contents/Home'

		local jdtls_path = vim.fn.expand('~/Projects/Tools/Neovim/jdtls')
		local java_formatter = vim.fn.expand('~/Projects/Templates/java_formatter.xml')
		local java_debug = vim.fn.expand('~/.local/share/nvim/mason/packages/java-debug-adapter')

		local java_settings_prefs_path = vim.fn.expand('~/Projects/Templates/settings.prefs')

		-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
		local config = {
			-- The command that starts the language server
			-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
			cmd = {

				-- 💀
				java17_home .. '/bin/java', -- or '/path/to/java17_or_newer/bin/java'
				-- depends on if `java` is in your $PATH env variable and if it points to the right version.

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

				-- 💀
				'-jar',
				jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar'
				,
				-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
				-- Must point to the                                                     Change this to
				-- eclipse.jdt.ls installation                                           the actual version


				-- 💀
				'-configuration', jdtls_path .. '/config_mac_arm',
				-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
				-- Must point to the                      Change to one of `linux`, `win` or `mac`
				-- eclipse.jdt.ls installation            Depending on your system.

				-- 💀
				-- See `data directory configuration` section in the README
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
								name = "JavaSE-11",
								path = jfx11_home .. "/",
							},
							{
								name = "JavaSE-17",
								path = jfx17_home .. "/",
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
