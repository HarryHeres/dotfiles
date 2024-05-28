return {
    'mfussenegger/nvim-dap',

    config = function()
        local dap = require('dap')

        local pretty_printing = {
            {
                text = '-enable-pretty-printing',
                description = 'enable pretty printing',
                ignoreFailures = false
            },
        }

        dap.configurations.java = {
            {
                type = 'java',
                request = 'launch',
                name = 'Debug (Local)',
                program = '${file}',
                setupCommands = pretty_printing,
            },
            {
                type = "java",
                name = "Debug (Attach) localhost",
                request = "attach",
                hostName = "127.0.0.1",
                port = "8787",
                projectName = "",
                setupCommands = pretty_printing,
            },
        }

        dap.adapters.lldb = {
            type = 'executable',
            command = '/usr/bin/lldb-vscode',
            name = 'lldb'
        }

        dap.adapters.python = function(cb, config)
            -- if config.request == 'attach' then
            --     ---@diagnostic disable-next-line: undefined-field
            --     local port = (config.connect or config).port
            --     ---@diagnostic disable-next-line: undefined-field
            --     local host = (config.connect or config).host or '127.0.0.1'
            --     cb({
            --         type = 'server',
            --         port = assert(port, '`connect.port` is required for a python `attach` configuration'),
            --         host = host,
            --         options = {
            --             source_filetype = 'python',
            --         },
            --     })
            -- else
            cb({
                type = 'executable',
                command = 'python',
                args = { '-m', 'debugpy.adapter' },
                options = {
                    source_filetype = 'python',
                },
            })
            -- end
        end

        dap.configurations.cpp = {
            {
                name = "Debug (Local)",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
                setupCommands = pretty_printing
            },
        }

        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = {
            {
                name = "Debug (Local)",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
                setupCommands = pretty_printing,
                initCommands = function()
                    -- Find out where to look for the pretty printer Python module
                    local rustc_sysroot = vim.fn.trim(vim.fn.system('rustc --print sysroot'))

                    local script_import = 'command script import "' ..
                        rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
                    local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'

                    local commands = {}
                    local file = io.open(commands_file, 'r')
                    if file then
                        for line in file:lines() do
                            table.insert(commands, line)
                        end
                        file:close()
                    end
                    table.insert(commands, 1, script_import)

                    return commands
                end,
            },
        }

        dap.adapters.coreclr = {
            type = 'executable',
            command = '/usr/local/netcoredbg',
            args = { '--interpreter=vscode' }
        }

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "Debug (local)",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to DLL: ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end,
            },
        }

        dap.configurations.python = {
            {
                -- The first three options are required by nvim-dap
                type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
                request = 'launch',
                name = "Launch file",

                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                program = "${file}", -- This configuration will launch the current file if used.
                -- pythonPath = function()
                --     -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                --     -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                --     -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                --     local cwd = vim.fn.getcwd()
                --     if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                --         return cwd .. '/venv/bin/python'
                --     elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                --         return cwd .. '/.venv/bin/python'
                --     else
                --         return '/usr/bin/python'
                --     end
                -- end,
            },
        }


        vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#000000', bg = '#f38ba8' })
        vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#000000', bg = '#89b4fa' })
        vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#000000', bg = '#a6e3a1' })

        vim.fn.sign_define('DapBreakpoint', {
            text = 'Br',
            texthl = 'DapBreakpoint',
            linehl = 'DapBreakpoint',
            numhl = 'DapBreakpoint'
        })
        vim.fn.sign_define('DapBreakpointCondition',
            { text = 'C', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointRejected',
            { text = 'R', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
        vim.fn.sign_define('DapLogPoint',
            { text = 'L', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
        vim.fn.sign_define('DapStopped',
            { text = 'S', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

        dap.defaults.fallback.terminal_win_cmd = 'below 10 new'
    end
}
