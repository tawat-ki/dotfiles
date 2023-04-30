vim.opt.list = true
vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "space:•"
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "trail:⋅"
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2b2b2b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#555555 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#7f7f7f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#bdbdbd gui=nocombine]]
require("indent_blankline").setup {
  space_char_blankline = "⋅",
  --space_char_blankline = "•",
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    --"IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    
  },
}
vim.opt.termguicolors = true
--normal rainbow
--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
-- rainbow dracular
--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#8be9fd gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#50fa7b gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#ffb86c gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent4 guifg=#ff79c6 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent5 guifg=#bd93f9 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent6 guifg=#ff5555 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent7 guifg=#f1fa8c gui=nocombine]]
----
--require("indent_blankline").setup {
--  space_char_blankline = "⋅",
--  char_highlight_list = {
--    --"IndentBlanklineIndent2",
--    --"IndentBlanklineIndent7",
--    --"IndentBlanklineIndent3",
--    --"IndentBlanklineIndent6",
--    --"IndentBlanklineIndent4",
--    --"IndentBlanklineIndent5",
--    --"IndentBlanklineIndent1",
--    --
--  },

--}
