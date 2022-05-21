"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

set number relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set incsearch
set nocompatible
set noshowmode
set colorcolumn=81
set spelllang=en_us
set spell
set completeopt=menu,menuone,noselect
filetype plugin indent on
syntax on
set so=12

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tmsvg/pear-tree'

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
"Plug 'mfussenegger/nvim-dap'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'

Plug 'lervag/vimtex'
Plug 'vimwiki/vimwiki'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'

Plug 'romgrk/doom-one.vim'
Plug 'morhetz/gruvbox'
Plug 'eddyekofo94/gruvbox-flat.nvim'

call plug#end()

nnoremap <SPACE> <Nop>
let mapleader = " "
let maplocalleader = ","
nnoremap Y y$
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:lightline = {'colorscheme': 'one'}

source ~/dotfiles/config/nvim/vimtex.vim
source ~/dotfiles/config/nvim/vimwiki.vim
source ~/dotfiles/config/nvim/vimlsp.vim
source ~/dotfiles/config/nvim/vimfzf.vim

"COMMENTING
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>

"PARENTHESIS COMPLETION
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

"OPEN LINES
nnoremap <silent> <leader>o 
            \:<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O 
            \:<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

"KEEP CENTER WHEN SEARCHING
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"SYSTEM CLIPBOARD
nnoremap <leader>y <S-v>"+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "_dP

"SELECT ALL
nnoremap <leader>a gg<S-v>G

"MOVE TEXT
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==

"UNDO POINTS
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

"COLORS
"let g:gruvbox_invert_selection=0
"let g:gruvbox_contrast_dark='hard'
"set bg=dark
set termguicolors
"colorscheme gruvbox
colorscheme gruvbox-flat
let g:gruvbox_flat_style = "dark"
"colorscheme doom-one
hi Normal guibg=NONE ctermbg=NONE guifg=#f5e6d1
hi NormalNC guibg=NONE ctermbg=NONE guifg=#f5e6d1
hi NormalFloat guibg=NONE ctermbg=NONE guifg=#f5e6d1
hi LineNr guibg=NONE ctermbg=NONE
hi Folded guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi SpecialKey guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi CursorLineNr guibg=NONE ctermbg=NONE

"DISABLE ARROW KEYS
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
