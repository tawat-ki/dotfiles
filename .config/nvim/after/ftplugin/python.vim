set tabstop =4
set softtabstop =4
set shiftwidth =4
set expandtab
let g:jupyter_cell_separators = ['# %%']
"chatgpt said 'color that has highest contrast with #6272a4, #ffffff, and #282a36 is #FFA500'.   
fun! SetCellHighlighting()
    for cell_separator in g:jupyter_cell_separators
        let regex_cell= "^" . cell_separator . "\\([^#]\\|$\\).*$"
        "let regex_cell= "^\s*# %%"\\([^#]\\|$\\).*$"
        let match_cmd = "syntax match JupyterCell \"" . regex_cell . "\"" 
        "let highlight_cmd = "highlight JupyterCell ctermfg=255 guifg=#6272A4 ctermbg=022 guibg=#faf9de cterm=bold gui=bold"
        let highlight_cmd = "highlight JupyterCell ctermfg=255 guifg=#eeeeee ctermbg=022 guibg=#FFA500 cterm=bold gui=bold"
        if !hlexists('JupyterCell')
            execute highlight_cmd
        endif
        execute match_cmd
    endfor
endfu
autocmd bufenter * :call SetCellHighlighting()
augroup MyCustomHighlights
    autocmd!
    autocmd ColorScheme * :call SetCellHighlighting()
augroup END
" white color 
"let highlight_cmd = "highlight JupyterCell ctermfg=255 guifg=#eeeeee ctermbg=022 guibg=#005f00 cterm=bold gui=bold"

"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview
