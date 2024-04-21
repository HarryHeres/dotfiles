return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        {
            "williamboman/mason-lspconfig.nvim",
            name = "lspconfig"
        },
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )


        capabilities.textDocument.completion.completionItem.snippetSupport = true

        require("fidget").setup({})
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                'bashls',
                'clangd',
                'cmake',
                'cssls',
                'eslint',
                'html',
                'intelephense',
                'lemminx',
                'lua_ls',
                'marksman',
                'pylsp',
                'rust_analyzer',
                'tailwindcss',
                'texlab',
                'tsserver',
                'yamlls'
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    require('lspconfig').lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ['clangd'] = function()
                    require 'lspconfig'.clangd.setup {
                        capabilities = capabilities,
                        cmd = { "clangd", "--header-insertion=never" },
                        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cl" },
                    }
                end,

                ['cssls'] = function()
                    require 'lspconfig'.cssls.setup {
                        capabilities = capabilities,
                        settings = {
                            css = {
                                lint = {
                                    unknownAtRules = "ignore"
                                }
                            }
                        }
                    }
                end,

                ['intelephense'] = function()
                    require 'lspconfig'.intelephense.setup {
                        capabilities = capabilities,
                        global_storage_path = "~/.local/share/nvim"
                    }
                end,

                ['lemminx'] = function()
                    require 'lspconfig'.lemminx.setup {
                        capabilities = capabilities,
                        settings = {
                            format = {
                                enabled = true,
                                splitAttributes = false,
                                joinCDATALines = false,
                                joinContentLines = false,
                                spaceBeforeEmptyCloseTag = false
                            }
                        }

                    }
                end,

                ['marksman'] = function()
                    require 'lspconfig'.marksman.setup {
                        capabilities = capabilities,
                        filetypes = { "markdown", "md" },
                        sigle_file_support = true
                    }
                end,

                ['omnisharp'] = function()
                    local pid = vim.fn.getpid()
                    local omnisharp_bin = "/home/harry/.local/share/nvim/mason/bin/omnisharp"

                    require 'lspconfig'.omnisharp.setup {
                        capabilities = capabilities,
                        cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },

                        enable_editorconfig_support = true,

                        enable_import_completion = true,
                        organize_imports_on_format = true
                    }
                end,

                ['pylsp'] = function()
                    require 'lspconfig'.pylsp.setup {
                        capabilities = capabilities,
                        settings = {
                            pylsp = {
                                plugins = {
                                    pycodestyle = {
                                        enabled = false,
                                        maxLineLength = 999,
                                    },
                                    pylint = {
                                        enabled = false
                                    },
                                    pyflakes = {
                                        enabled = false
                                    }
                                },

                                jedi_completion = {
                                    fuzzy = false,
                                    include_class_objects = true,
                                    include_function_objects = true,
                                    eager = true
                                }
                            }
                        }
                    }
                end,

                -- ['pyright'] = function()
                --     require 'lspconfig'.pyright.setup {
                --         settings = {
                --             python = {
                --                 analysis = {
                --                     extra_paths = {
                --                         "/opt/3dslicer/bin/",
                --                         "/opt/3dslicer/bin/Python",
                --                         "/opt/3dslicer/lib",
                --                         "/opt/3dslicer/lib/Python/lib/python3.9",
                --                         "/opt/3dslicer/lib/QtPlugins",
                --                         "/opt/3dslicer/lib/Slicer-5.4",
                --                         "/opt/3dslicer/bin/Python/vtkmodules"
                --                     }
                --                 }
                --             }
                --         }
                --     }
                -- end,

                -- ['rust_analyzer'] = function()
                --     require 'lspconfig'.rust_analyzer.setup({})
                -- end,

                -- ['tailwindcss'] = function()
                --     require 'lspconfig'.tailwindcss.setup({})
                -- end,

                ['texlab'] = function()
                    local forward_search_args = {
                        '--reuse-window',
                        -- '--execute-command', 'toggle_synctex', -- Open Sioyek in synctex mode.
                        -- '--inverse-search',
                        -- [[nvim-texlabconfig -file %%%1 -line %%%2 -server ]] .. vim.v.servername,
                        '--forward-search-file', '%f',
                        '--forward-search-line', '%l', '%p'
                    }

                    local pdf_executable = 'sioyek'


                    require('lspconfig').texlab.setup({
                        capabilities = capabilities,
                        filetypes = { "tex", "bib" },

                        settings = {
                            texlab = {
                                auxDirectory = "build",
                                build = {
                                    -- args = { "-X", "compile", "%f", "-k", "-o", "build", "--synctex", "--keep-logs" },
                                    -- executable = "tectonic",
                                    args = { "-pdf", "-output-directory=build", "-interaction=nonstopmode", "-synctex=1", "%f" },
                                    executable = "latexmk",
                                    forwardSearchAfter = false,
                                    onSave = true
                                },

                                forwardSearch = {
                                    executable = pdf_executable,
                                    args = forward_search_args
                                }
                            }
                        }

                    })
                end,
            },
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Enter>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'path' },
                { name = 'buffer' },
                { name = 'cmdline' },
                { name = 'nvim-lua' },
            })
        })

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
        })

        -- Diagnostic signs
        local signs = { Error = " ", Warn = "", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    end
}
