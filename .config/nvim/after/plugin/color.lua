--#30384f darkerer grey
--#485478 darker grey
--#6272A4  grey
vim.cmd([[
augroup MyColors
autocmd!
autocmd ColorScheme * highlight IndentBlanklineContextChar guifg=#00FF00 gui=nocombine
autocmd ColorScheme * highlight IndentBlanklineSpaceChar guifg=#485478 gui=nocombine
autocmd ColorScheme * highlight IndentBlanklineChar guifg=#485478 gui=nocombine
autocmd ColorScheme * highlight NonText ctermfg=7 guifg=#485478
"autocmd ColorScheme * highlight clear NonText 
autocmd ColorScheme * highlight IndentBlanklineContextStart cterm=italic gui=italic guisp=#00FF00 
autocmd ColorScheme * highlight HighlightWord gui=bold
augroup end
]])
require('lualine').setup {
  options = {
    -- ...
    theme = 'dracula-nvim'
    -- ...
  }
}
-- customize dracula color palette
vim.g.dracula_colors = {
  bg = "#282A36",
  fg = "#F8F8F2",
  selection = "#44475A",
  comment = "#6272A4",
  red = "#FF5555",
  orange = "#FFB86C",
  yellow = "#F1FA8C",
  green = "#50fa7b",
  purple = "#BD93F9",
  cyan = "#8BE9FD",
  pink = "#FF79C6",
  bright_red = "#FF6E6E",
  bright_green = "#69FF94",
  bright_yellow = "#FFFFA5",
  bright_blue = "#D6ACFF",
  bright_magenta = "#FF92DF",
  bright_cyan = "#A4FFFF",
  bright_white = "#FFFFFF",
  menu = "#21222C",
  visual = "#3E4452",
  gutter_fg = "#4B5263",
  nontext = "#3B4048",
}
-- show the '~' characters after the end of buffers
vim.g.dracula_show_end_of_buffer = true
-- use transparent background
vim.g.dracula_transparent_bg = false
-- set custom lualine background color
vim.g.dracula_lualine_bg_color = "#44475a"
-- set italic comment
vim.g.dracula_italic_comment = true
vim.cmd[[colorscheme dracula]]
