require('settings')
require('keymaps')
require('plugins')
require('lsp-config')
require('vimtex-config')
require('vimwiki-config')

-- These bindings dont work with nest plugin for some reason
vim.cmd('nmap g. [,bvi,')
vim.cmd('nmap g/ ],wvi,')
vim.cmd('xmap g. <esc>[,bvi,')
vim.cmd('xmap g/ <esc>],wvi,')
