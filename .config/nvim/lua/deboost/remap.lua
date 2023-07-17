local nnoremap = require("deboost.keymap").nnoremap
local vnoremap = require("deboost.keymap").vnoremap

nnoremap("<leader>pv","<cmd>Ex<cr>")
nnoremap("<C-c>","<silent> <C-c>")
nnoremap("<leader>ff","<cmd>Telescope find_files<CR>")
nnoremap("<leader>fF","<cmd>Telescope find_files hidden=true<CR>")
nnoremap("<leader>fg","<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fG","<cmd>Telescope live_grep hidden=true<cr>")
nnoremap("<leader>bb","<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh","<cmd>Telescope help_tags<cr>")
nnoremap("<leader>pb","<C-^>")
--nnoremap("<leader>ww","<cmd>w<CR>")
--nnoremap("<leader>P","\"+p")
--nnoremap("<leader>yy","\"+yy")
--vnoremap("<leader>P","\"+p")
--vnoremap("<leader>y","\"+y")
-->>>jupyter

-->>>jupyter
--jump between cells
--noremap
-- Run current file
--nnoremap("<leader>jj"," <cmd>JupyterConnect<cr>",{ silent = true })
--nnoremap("<leader>R"," <cmd>JupyterRunFile<cr>",{ silent = true })
--nnoremap("<leader>I","<cmd>PythonImportThisFile<CR>",{ silent = true})
--
---- Change to directory of current file
--nnoremap("<leader>d", "<cmd>JupyterCd %:p:h<CR>",{ silent = true})
--
---- Send a selection of lines
--nnoremap("<leader><cr>","<cmd>JupyterSendCell<CR>",{ silent = true})
--nnoremap("<leader>E", "<cmd>JupyterSendRange<CR>",{ silent = true})
--nnoremap("<leader>e","<Plug>JupyterRunTextObj",{ silent = true})
--vnoremap("<leader>e"," <Plug>JupyterRunVisual",{ silent = true})
--
---- Debugging maps
--nnoremap ("<leader>b","<cmd>PythonSetBreak<CR>",{ silent = true})
----<<<jupyter
--vim.api.nvim_set_keymap('n', '<leader>b', ":lua require('deboost/telescope').my_buffer()<cr>", {noremap = true})
nnoremap("<leader><cr>","<cmd>w<cr><bar><Plug>JupyterExecute",{ silent = true})
nnoremap("<leader>r","<cmd>w<cr><bar><Plug>JupyterExecuteAll",{ silent = true})
nnoremap("<leader>RR","<Plug>JupyterRestart",{ silent = true})
nnoremap("<leader>n","<cmd>/^# %%\\([^#]\\|$\\).*$<cr>")
nnoremap("<leader>N","<cmd>?^# %%\\([^#]\\|$\\).*$<cr>")
nnoremap("<C-d>","<C-d>zz")
nnoremap("<C-u>","<C-u>zz")
nnoremap ("<leader>mp","<cmd>MarkdownPreview<CR>",{ silent = true})
--vim.api.nvim_set_keymap('i', '<esc>', '<esc>:w<cr>', {noremap = true, silent = true})
