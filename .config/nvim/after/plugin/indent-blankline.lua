vim.opt.list = true
vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "space:•"
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "trail:⋅"
local highlight = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#2b2b2b" })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#555555" })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#7f7f7f" })
    vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#bdbdbd" })
end)
require("ibl").setup { indent = { highlight = highlight }}
--require("indent_blankline").setup {
--  ,
--  --space_char_blankline = "•",
--  show_current_context = true,
--  show_current_context_start = true,
--  char_highlight_list = {
--    --"IndentBlanklineIndent1",
--    "IndentBlanklineIndent2",
--    "IndentBlanklineIndent3",
--    "IndentBlanklineIndent4",
--    
--  },
--}
--vim.opt.termguicolors = true
-------------------------------------
