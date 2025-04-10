return {
	'harryheres/nvim-jdtls',
	-- dir = vim.fn.expand("~/Projects/Tools/Neovim/nvim-jdtls/"),
	name = 'jdtls',

	config = function()
		local jdtls = require('jdtls')
		local java_cmds = vim.api.nvim_create_augroup('java_cmds', { clear = true })
		local project_dir = vim.fn.expand('~/.local/share/nvim/jdtls_projects')

		local java21_home = '/usr/lib/jvm/java-21-openjdk'
		local java17_home = '/usr/lib/jvm/java-17-openjdk'
		local java11_home = '/usr/lib/jvm/java-11-openjdk'
		local jfx17_home = '/usr/lib/jvm/liberica-jdk-17-full/'
		local jfx11_home = '/usr/lib/jvm/liberica-jdk-11-full'

		local jdtls_path = vim.fn.expand('~/Projects/Tools/Neovim/jdtls/org.eclipse.jdt.ls.product/target/repository')
		local java_formatter = vim.fn.expand('~/Projects/Templates/java_formatter.xml')

		local java_settings_prefs_path = vim.fn.expand('~/Projects/Templates/settings.prefs')

		-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
		local config = {
			-- The command that starts the language server
			-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
			cmd = {

				-- 💀
				java21_home .. '/bin/java', -- or '/path/to/java17_or_newer/bin/java'
				-- depends on if `java` is in your $PATH env variable and if it points to the right version.

				'-Declipse.application=org.eclipse.jdt.ls.core.id1',
				'-Dosgi.bundles.defaultStartLevel=4',
				'-Declipse.product=org.eclipse.jdt.ls.core.product',
				'-Dlog.protocol=true',
				'-Dlog.level=ALL',
				'-Xmx4g',
				'--add-modules=ALL-SYSTEM',
				'--add-opens', 'java.base/java.util=ALL-UNNAMED',
				'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

				-- 💀
				'-jar',
				jdtls_path .. '/plugins/org.eclipse.equinox.launcher_1.6.1100.v20250306-0509.jar',
				-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
				-- Must point to the                                                     Change this to
				-- eclipse.jdt.ls installation                                           the actual version


				-- 💀
				'-configuration', jdtls_path .. '/config_linux',
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
			root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', '.gitignore' }),

			on_attach = function(client, bufrn)
				local jdtls_dap = require('jdtls.dap')
				jdtls_dap.fetch_main_configs(function(configurations)
					local dap = require('dap')
					for _, config in ipairs(configurations) do
						if config.request == "launch" then
							config.args = function()
								return vim.fn.input("Program arguments: ")
							end
							table.insert(dap.configurations.java, config)
						end
					end
				end)
			end,

			-- Here you can configure eclipse.jdt.ls specific settings
			-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
			-- for a list of options
			settings = {
				java = {
					settings = {
						url = java_settings_prefs_path
					},
					signatureHelp = {
						enabled = 'true'
					},

					configuration = {
						runtimes = {
							{
								name = "JavaSE-21",
								path = java21_home .. "/",
							},
							{
								name = "JavaSE-17",
								path = java17_home .. "/",
							},
							{
								name = "JavaSE-11",
								path = java11_home .. "/",
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
						}
						-- comments = {
						-- 	enabled = 'false',

						-- 	insertSpaces = 'true',
						-- 	onType = 'true',
						-- 	tabSize = 4
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
					vim.fn.glob(
						vim.fn.expand(
							'~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar'),
						1),
				}
			},
		}

		-- This starts a new client & server,
		-- or attaches to an existing client & server depending on the `root_dir`.
		-- print("Setting up JDTLS...")
		-- jdtls.start_or_attach(config)

		local function jdtls_setup(event)
			-- print("Attaching JDTLS...")
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
