JDTLS_CONFIGS = {}

return {
	"harryheres/nvim-jdtls",
	dir = vim.fn.expand("~/Projects/FOSS/nvim-jdtls/"),
	name = "jdtls",

	config = function()
		local jdtls = require("jdtls")
		local java_cmds = vim.api.nvim_create_augroup("java_cmds", { clear = true })
		local workspace_dir = vim.fn.getcwd() .. "/.nvim/java/jdtls"
		local java_home = vim.fn.expand("~/.sdkman/candidates/java/21.0.7-tem/")

		local java_settings_prefs_path = vim.fn.expand("~/Projects/Templates/settings.prefs")

		-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
		local config = {
			-- The command that starts the language server
			-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
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
					"~/Projects/Tools/Neovim/jdtls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar"
				),
				"-configuration",
				vim.fn.expand(
					"~/Projects/Tools/Neovim/jdtls/org.eclipse.jdt.ls.product/target/repository/config_mac_arm"
				),
				"-data",
				workspace_dir,
			},

			-- 💀
			-- One dedicated LSP server & client will be started per unique root_dir
			root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),

			on_attach = function(client, bufrn)
				if #JDTLS_CONFIGS > 0 then
					vim.notify("Tried to attach jdtls to buffer " .. bufrn)
					return
				end

				local jdtls_dap = require("jdtls.dap")
				local dap = require("dap")

				jdtls_dap.fetch_main_configs(function(configurations)
					for _, config in ipairs(configurations) do
						if config.request == "launch" then
							config.args = function()
								return vim.fn.input("Program arguments: ")
							end
						end
						table.insert(dap.configurations.java, config)
					end
					JDTLS_CONFIGS = configurations
				end)

				-- Hot code replacing
				dap.listeners.before["event_processid"]["jdtls"] = function() end
				dap.listeners.before["event_telemetry"]["jdtls"] = function() end

				dap.listeners.before["event_hotcodereplace"]["jdtls"] = function(session, body)
					vim.notify(body.changeType)
					if body.changeType == jdtls_dap.hotcodereplace_type.BUILD_COMPLETE then
						vim.notify("Applying code changes")
						session:request("redefineClasses", nil, function(err)
							assert(not err, vim.inspect(err))
						end)
					elseif body.message then
						vim.notify(body.message)
					end
				end

				dap.adapters.java = jdtls_dap.start_debug_adapter
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
							url = vim.fn.getcwd() .. "/.nvim/java/formatter.xml",
						},
					},

					cleanup = {
						addOverride = "@Override",
						addDeprecated = "@Deprecated",
						addFinalModifier = "final",
					},
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
						"~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
						1
					),
				},
			},
		}

		-- This starts a new client & server,
		-- or attaches to an existing client & server depending on the `root_dir`.
		-- print("Setting up JDTLS...")
		-- jdtls.start_or_attach(config)

		local function jdtls_setup(event)
			jdtls.start_or_attach(config)
		end

		vim.api.nvim_create_autocmd("FileType", {
			group = java_cmds,
			pattern = { "java" },
			desc = "Setup JDTLS",
			callback = jdtls_setup,
		})
	end,
}
