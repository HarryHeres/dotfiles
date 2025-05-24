return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        height = 20,
        auto_preview = false
        -- action_keys = {
        --     next = "n",
        --     previous = "p"
        -- },
    },
    keys = {
        {
            "<leader>D",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
    }
}
