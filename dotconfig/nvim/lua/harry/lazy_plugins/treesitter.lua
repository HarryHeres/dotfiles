return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require 'nvim-treesitter.configs'.setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "cpp", "java", "c", "lua", "vim", "vimdoc", "sql", "latex", "markdown", "html" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = false,

            -- indent = {
            --   enable = true
            -- },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = { "csv" },
            },

            autotag = {
                enable = true
            }
        })

        vim.treesitter.language.register('c', 'lisp') -- the someft filetype will use the python parser and queries.
    end
}
