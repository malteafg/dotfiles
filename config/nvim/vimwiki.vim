let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{
        \ 'path': '~/files/vimwiki/text/',
        \ 'path_html': '~/files/vimwiki/vimwiki_html/', 
        "\ 'syntax': 'markdown',
        "\ 'ext': '.md',
        \ 'template_path': '~/files/vimwiki/templates/',
        \ 'template_default': 'default'}]
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2

augroup wiki
  au BufNewFile,BufRead *.wiki   set filetype=wiki
augroup end
autocmd FileType wiki nnoremap <Esc> :VimwikiGoBackLink<CR>
