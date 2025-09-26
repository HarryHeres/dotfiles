vim.keymap.set("n", "<leader>fe", ":Oil<CR>")

-- Clipboard managing
vim.keymap.set("n", "<leader>yy", '"+yy<CR>', { noremap = true })
vim.keymap.set("v", "<leader>y", '"+y<CR>', { noremap = true })

-- Remap window switching
vim.keymap.set("n", "<C-h>", "<C-W>h", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-v>", "<C-w>v", { noremap = true })
vim.keymap.set("n", "<C-s>", "<C-w>s", { noremap = true })
vim.keymap.set("n", "<C-p>", "<C-o>", { noremap = true })
vim.keymap.set("n", "<C-n>", "<C-i>", { noremap = true })
vim.keymap.set("n", "<C-b>", "<C-o>", { noremap = true })

-- Git
vim.keymap.set("n", "<leader>g", vim.cmd.Git)
vim.keymap.set("n", "<leader>gb", "<cmd>:Git blame<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>sx", ":split<CR> :term<CR>")
vim.keymap.set("n", "<leader>vx", ":vsplit<CR> :term<CR>")

-- Window resizing
vim.keymap.set("n", "<C-S-h>", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-j>", ":horizontal resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-k>", ":horizontal resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-l>", ":vertical resize +5<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-B>", function()
    require("dap").toggle_breakpoint()
end, { noremap = true })

vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
end, { noremap = true })

vim.keymap.set("n", "<F6>", function()
    require("dapui").toggle()
end, { noremap = true })

vim.keymap.set("n", "<F10>", function()
    require("dap").step_over()
end, { noremap = true })

vim.keymap.set("n", "<F11>", function()
    require("dap").step_into()
end, { noremap = true })

vim.keymap.set("n", "<F12>", function()
    require("dap").step_out()
end, { noremap = true })

-- Reset word highlight
vim.keymap.set("n", "<leader>n", "<cmd>noh<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gi", function()
            vim.lsp.buf.implementation()
        end, opts)
        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "gD", function()
            vim.lsp.buf.declaration()
        end, opts)
        vim.keymap.set("n", "<S-h>", function()
            vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "gr", function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<F2>", function()
            vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("n", "<C-i>", function()
            vim.lsp.buf.signature_help()
        end, opts)
        vim.keymap.set("n", "<leader>qf", function()
            vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<C-S-d>", function()
            vim.diagnostic.open_float()
        end, opts)
    end,
})

-- Telescope
vim.keymap.set("n", "<leader>h", ":Telescope neoclip<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ff", function()
    require("telescope.builtin").find_files({ hidden = false, no_ignore = false })
end)

vim.keymap.set("n", "<leader>G", function()
    require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end)

vim.keymap.set("n", "<leader>ps", require("telescope.builtin").live_grep, {})
