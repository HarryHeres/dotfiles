require("harry.others.remap")
require("harry.others.set")
require("harry.lazy_init")

local augroup = vim.api.nvim_create_augroup
local HarryGroup = augroup('Harry', {})

vim.api.nvim_create_autocmd('LspAttach', {
    group = HarryGroup,
    callback = function(e)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "<S-h>", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', '<F4>', "<cmd>lua require'dap'.repl.toggle()<CR>", opts)
        vim.keymap.set("n", "<C-i>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', "<leader>qf", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', "<C-S-d>", function() vim.diagnostic.open_float() end, opts)
    end
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = HarryGroup,
    pattern = "*",
    command = ":lua vim.lsp.buf.format()"
})

-- Swift LSP
require('harry.others.swift')
