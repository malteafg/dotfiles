require('settings')
require('keymaps')
require('plugins')
require('lsp-config')
require('vimtex-config')
require('vimwiki-config')

-- These bindings dont work with nest plugin for some reason
vim.cmd('nmap <c-e> ],wvi,')
vim.cmd('nmap <c-n> [,bvi,')
vim.cmd('xmap <c-e> <esc>],wvi,')
vim.cmd('xmap <c-n> <esc>[,bvi,')
