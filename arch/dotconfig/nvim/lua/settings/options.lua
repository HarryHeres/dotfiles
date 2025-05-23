vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.api.nvim_command('set spelllang=en,cs')
vim.api.nvim_command('set spell')

vim.api.nvim_command('autocmd BufNewFile,BufRead *.tpp set filetype=cpp')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.blade.php set filetype=php')

vim.api.nvim_command('set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<')
