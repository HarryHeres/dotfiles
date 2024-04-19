vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fe", vim.cmd.Ex)

-- Clipboard managing
vim.keymap.set('n', '<leader>yy', '"+yy<CR>', { noremap = true })
vim.keymap.set('v', '<leader>y', '"+y<CR>', { noremap = true })

-- Remap window switching
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-v>', '<C-w>v', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-s>', '<C-w>s', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<C-o>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', '<C-i>', { noremap = true })
vim.api.nvim_set_keymap("n", "<C-b>", "<C-o>", { noremap = true })


vim.keymap.set("n", "<leader>g", vim.cmd.Git) -- Vim figutive

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>sx", ":split<CR> :term<CR>")
vim.keymap.set("n", "<leader>vx", ":vsplit<CR> :term<CR>")

vim.keymap.set("n", "<leader>p", ":Telescope project<CR>")

-- Window resizing
vim.api.nvim_set_keymap("n", "<C-S-h>", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-j>", ":horizontal resize +5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-k>", ":horizontal resize -5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-l>", ":vertical resize +5<CR>", { noremap = true, silent = true })

-- Debugging shortcuts
function showScopes()
    local widgets = require('dap.ui.widgets')
    local sidebar = widgets.sidebar(widgets.scopes)
    sidebar.open()
end

vim.api.nvim_set_keymap('n', '<C-B>', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F4>', "<cmd lua require'dap'.repl()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F5>', "<cmd>lua require'dap'.continue()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F6>', "<cmd>lua showScopes()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F12>', "<cmd>lua require'dap'.step_out()<CR>", { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>h', ":Telescope neoclip<CR>", { noremap = true })

-- LSP Diagnostic
vim.keymap.set("n", "<leader>D", function() require("trouble").toggle() end)
