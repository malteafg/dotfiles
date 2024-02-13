-- LSP setup
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
  suggest_lsp_servers = false,
})
local noremap = {remap = false}
local bind = vim.keymap.set

bind('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', noremap)
bind('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', noremap)
bind('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', noremap)
bind('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', noremap)
bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', noremap)
bind('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', noremap)
bind('n', '<F3>', '<cmd>lua vim.lsp.buf.hover()<cr>', noremap)
bind('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', noremap)
bind('n', '<F7>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', noremap)

bind('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', noremap)
bind('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', noremap)
bind('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', noremap)

lsp.setup()

