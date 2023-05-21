vim.opt.nu             = true -- line number
vim.opt.relativenumber = true -- relative line number

vim.opt.tabstop        = 4
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true

vim.opt.smartindent    = true

vim.opt.wrap           = false

vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.undodir        = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile       = true

vim.opt.hlsearch       = false
vim.opt.incsearch      = true

vim.opt.termguicolors  = true

vim.opt.scrolloff      = 4
vim.opt.signcolumn     = "yes"

vim.opt.updatetime     = 50

vim.opt.colorcolumn    = "120"

vim.opt.completeopt    = 'menu,preview,noselect'

vim.opt.isfname:append("@-@")
