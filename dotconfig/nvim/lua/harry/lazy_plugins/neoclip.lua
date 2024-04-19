return {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
        { 'nvim-telescope/telescope.nvim' },
        { 'kkharji/sqlite.lua',           module = 'sqlite' },
    },
    config = function()
        require('telescope').load_extension('neoclip')
        require('neoclip').setup({
            history = 1000,
            enable_persistent_history = true,
            length_limit = 1048576,
            continuous_sync = true,
            db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
            filter = nil,
            preview = true,
            prompt = nil,
            default_register = '"',
            default_register_macros = 'q',
            enable_macro_history = true,
            content_spec_column = true,
            disable_keycodes_parsing = false,
            on_select = {
                move_to_front = false,
                close_telescope = true,
            },
            on_paste = {
                set_reg = true,
                move_to_front = false,
                close_telescope = true,
            },
            on_replay = {
                set_reg = false,
                move_to_front = false,
                close_telescope = true,
            },
            on_custom_action = {
                close_telescope = true,
            },

            keys = {
                telescope = {
                    i = {
                        select = '<CR>',
                        paste = 'p'
                    },
                    n = {
                        select = '<CR>',
                        paste = 'p'
                    }
                }
            }
        })
    end,
}
