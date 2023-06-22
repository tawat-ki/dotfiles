vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.showcmd = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.isfname:append("@-@")
vim.g.mapleader = " "
vim.g.python3_host_prog = '$HOME/python_venv/main/bin/python'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime=50
vim.cmd([[
autocmd CursorMoved * exe exists("HlUnderCursor")?HlUnderCursor?printf('match HighlightWord /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none':""
let HlUnderCursor=1
]])
