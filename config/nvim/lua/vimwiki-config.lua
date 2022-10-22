vim.cmd('let g:vimwiki_global_ext = 0')
vim.cmd("let g:vimwiki_list = [{'path': '~/files/vimwiki/text/', 'path_html': '~/files/vimwiki/vimwiki_html/', 'template_path': '~/files/vimwiki/templates/', 'template_default': 'default'}]")
vim.cmd('let g:indentLine_concealcursor=""')
vim.cmd('let g:indentLine_conceallevel=2')

vim.cmd('augroup wiki au BufNewFile,BufRead *.wiki set filetype=wiki augroup end')
vim.cmd('autocmd FileType wiki nnoremap <Esc> :VimwikiGoBackLink<CR>')
