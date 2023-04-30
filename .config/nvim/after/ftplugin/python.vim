set tabstop =2
set softtabstop =2
set shiftwidth =2
set expandtab
let g:jupyter_cell_separators = ['# %%']
fun! SetCellHighlighting()
    for cell_separator in g:jupyter_cell_separators
        let regex_cell= "^" . cell_separator . "\\([^#]\\|$\\).*$"
        let match_cmd = "syntax match JupyterCell \"" . regex_cell . "\"" 
        let highlight_cmd = "highlight JupyterCell ctermfg=255 guifg=#eeeeee ctermbg=022 guibg=#faf9de cterm=bold gui=bold"
        if !hlexists('JupyterCell')
            execute highlight_cmd
        endif
        execute match_cmd
    endfor
endfu
autocmd bufenter * :call SetCellHighlighting()

