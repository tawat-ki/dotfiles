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
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.colorcolumn = "80"
vim.opt.isfname:append("@-@")
vim.g.mapleader = " "
--vim.g.python3_host_prog = '/usr/bin/python3'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime=50
vim.opt.foldmethod='manual'
vim.cmd([[
autocmd CursorMoved * exe exists("HlUnderCursor")?HlUnderCursor?printf('match HighlightWord /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none':""
let HlUnderCursor=1
]])
--vim.cmd([[
--augroup vimrc
--  au BufReadPre * setlocal foldmethod=indent
--  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
--augroup END
--]])
--vim.cmd([[
--autocmd BufWinLeave *.* mkview!
--]])
--vim.cmd([[
--autocmd BufWinEnter *.* silent loadview
--]])

--vim.api.nvim_exec([[
--augroup cell_highlighting
--    autocmd!
--augroup END
--]], false)
--
--
--vim.g.jupyter_cell_separators = {'# %%'}
--vim.cmd([[
--fun! SetCellHighlighting()
--    for cell_separator in g:jupyter_cell_separators
--        let regex_cell= "^" . cell_separator . "\\([^#]\\|$\\).*$"
--        let match_cmd = "syntax match JupyterCell \"" . regex_cell . "\"" 
--        let highlight_cmd = "highlight JupyterCell ctermfg=255 guifg=#eeeeee ctermbg=022 guibg=#005f00 cterm=bold gui=bold"
--        if !hlexists('JupyterCell')
--            execute highlight_cmd
--        endif
--        execute match_cmd
--    endfor
--endfu
--]])
--
--vim.api.nvim_exec([[
--augroup cell_highlighting
--    autocmd FileType python lua SetCellHighlighting()
--augroup END
--]], false)
