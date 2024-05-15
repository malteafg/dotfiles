vim.cmd("let g:vimtex_view_method = 'zathura'")
vim.cmd('let g:vimtex_syntax_conceal_disable = 1')
vim.cmd("let g:vimtex_compiler_latexmk = { 'build_dir' : 'build', }")

-- vim.cmd(
--   'autocmd FileType tex inoremap ,sl \\begin{frame}<Enter>\\frametitle{}<Enter><Enter>(<>)<Enter><Enter>\\end{frame}<Enter><Enter>(<>)<Esc>6kf}i')
vim.cmd(
  'autocmd FileType tex inoremap ,im \\begin{figure}[h]<Enter>\\includegraphics[]{}<Enter>\\centering<Enter>\\end{figure}<Esc>2kf{a')

vim.cmd('autocmd FileType tex inoremap ,mt \\begin{matrix}  \\end{matrix}<Esc>Bhi')
vim.cmd('autocmd FileType tex inoremap ,mp \\begin{pmatrix}  \\end{pmatrix}<Esc>Bhi')
vim.cmd('autocmd FileType tex inoremap ,mb \\begin{bmatrix}  \\end{bmatrix}<Esc>Bhi')
vim.cmd('autocmd FileType tex inoremap ,mB \\begin{Bmatrix}  \\end{Bmatrix}<Esc>Bhi')
vim.cmd('autocmd FileType tex inoremap ,mv \\begin{vmatrix}  \\end{vmatrix}<Esc>Bhi')
vim.cmd('autocmd FileType tex inoremap ,mV \\begin{Vmatrix}  \\end{Vmatrix}<Esc>Bhi')

vim.cmd('autocmd FileType tex inoremap ,mi \\begin{align*}<Enter><Enter>\\end{align*}<Enter>(<>)<Esc>2ki<Tab>')
vim.cmd('autocmd FileType tex inoremap ,mn \\begin{align}<Enter><Enter>\\end{align}<Enter>(<>)<Esc>2ki<Tab>')

vim.cmd('autocmd FileType tex inoremap ,se \\section{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,sn \\section*{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,sse \\subsection{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,ssn \\subsection*{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,ssse \\subsubsection{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,sssn \\subsubsection*{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,sssse \\subsubsubsection{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,ssssn \\subsubsubsection*{}<Esc>i')

vim.cmd('autocmd FileType tex inoremap ,tc \\mathcal{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,tm \\mathbb{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,tb \\textbf{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,tx \\text{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,tt \\texttt{}<Esc>i')

vim.cmd('autocmd FileType tex inoremap ,a <Esc>Ea')
vim.cmd('autocmd FileType tex inoremap ,A <Esc>A')
vim.cmd('autocmd FileType tex inoremap ,R $$<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,r \\(\\)<Esc>hi')

vim.cmd('autocmd FileType tex inoremap ,la \\label{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,nc \\newcommand\\{(<>)}<Esc>5hi')
vim.cmd('autocmd FileType tex inoremap ,cr \\cref{}<Esc>i')

-- math stuff
vim.cmd('autocmd FileType tex inoremap ,fr \\frac{}{(<>)}<Esc>6hi')
vim.cmd('autocmd FileType tex inoremap ,_ _{}<Esc>i')
vim.cmd('autocmd FileType tex inoremap ,h ^{}<Esc>i')

vim.cmd('autocmd FileType tex inoremap <C-s> <Esc>:w<CR>a')
vim.cmd('inoremap <C-@> <C-Space>')
vim.cmd('autocmd FileType tex inoremap <C-Space> <Esc>/(<>)<CR>:noh<CR>cf)')
vim.cmd('nnoremap <C-@> <C-Space>')
vim.cmd('autocmd FileType tex nnoremap <C-Space> <Esc>/(<>)<CR>:noh<CR>cf)')
