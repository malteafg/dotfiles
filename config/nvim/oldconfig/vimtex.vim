let g:vimtex_view_method = 'zathura'
let g:vimtex_syntax_conceal_disable = 1

"LATEX
autocmd FileType tex inoremap ;sl \begin{frame}<Enter>\frametitle{}<Enter><Enter>(<>)<Enter><Enter>\end{frame}<Enter><Enter>(<>)<Esc>6kf}i

autocmd FileType tex inoremap ;mt \begin{matrix}  \end{matrix}<Esc>Bhi
autocmd FileType tex inoremap ;mp \begin{pmatrix}  \end{pmatrix}<Esc>Bhi
autocmd FileType tex inoremap ;mb \begin{bmatrix}  \end{bmatrix}<Esc>Bhi
autocmd FileType tex inoremap ;mB \begin{Bmatrix}  \end{Bmatrix}<Esc>Bhi
autocmd FileType tex inoremap ;mv \begin{vmatrix}  \end{vmatrix}<Esc>Bhi
autocmd FileType tex inoremap ;mV \begin{Vmatrix}  \end{Vmatrix}<Esc>Bhi

autocmd FileType tex inoremap ;ai \begin{align*}<Enter><Enter>\end{align*}<Enter>(<>)<Esc>2ki<Tab>
autocmd FileType tex inoremap ;an \begin{align}<Enter><Enter>\end{align}<Enter>(<>)<Esc>2ki<Tab>

autocmd FileType tex inoremap ;se \section{}<Enter>(<>)<Esc>k$i
autocmd FileType tex inoremap ;sn \section*{}<Enter>(<>)<Esc>k$i
autocmd FileType tex inoremap ;1se \subsection{}<Enter>(<>)<Esc>k$i
autocmd FileType tex inoremap ;1sn \subsection*{}<Enter>(<>)<Esc>k$i
autocmd FileType tex inoremap ;2se \subsubsection{}<Enter>(<>)<Esc>k$i
autocmd FileType tex inoremap ;2sn \subsubsection*{}<Enter>(<>)<Esc>k$i
autocmd FileType tex inoremap ;3se \subsubsubsection{}<Enter>(<>)<Esc>k$i
autocmd FileType tex inoremap ;3sn \subsubsubsection*{}<Enter>(<>)<Esc>k$i

autocmd FileType tex inoremap ;fr \frac{}{(<>)}(<>)<Esc>10hi

inoremap <C-@> <C-Space>
autocmd FileType tex inoremap <C-Space> <Esc>/(<>)<CR>:noh<CR>cf)
nnoremap <C-@> <C-Space>
autocmd FileType tex nnoremap <C-Space> <Esc>/(<>)<CR>:noh<CR>cf)
