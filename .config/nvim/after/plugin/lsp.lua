local lsp = require('lsp-zero').preset({})


lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr,omit = {},})
end)
lsp.ensure_installed({'lua_ls','pylsp'})
--local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--  ["<C-Space>"] = cmp.mapping.complete(),
--})
--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

vim.diagnostic.config({virtual_text = false,underline = false})
lsp.setup()
