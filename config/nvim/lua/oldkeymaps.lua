function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<space>', '<nop>') 
vim.g.mapleader = ' '
map('n', ',', '<nop>')
vim.g.maplocalleader = ','
map('n', '<leader>h', ':set hlsearch!<cr>')
map('n', '<leader>e', ':Neotree toggle<cr>')
-- map('n', '<leader>w', ':w<cr>')

-- Window controls
map('i', '<c-j>', '<c-w><c-j>')
map('i', '<c-k>', '<c-w><c-k>')
map('i', '<c-l>', '<c-w><c-l>')
map('i', '<c-h>', '<c-w><c-h>')
map('n', '<c-j>', '<c-w><c-j>')
map('n', '<c-k>', '<c-w><c-k>')
map('n', '<c-l>', '<c-w><c-l>')
map('n', '<c-h>', '<c-w><c-h>')
map('n', '<leader>w', '<c-w>')

map('n', 'Y', 'y$')

-- Open lines
map('n', '<leader>o', ':<C-u>call append(line("."), repeat([""], v:count1))<cr>')
map('n', '<leader>O', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<cr>')

-- Center while searching
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

-- System clipboard
map('n', '<leader>y', '<s-v>"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>p', '"+p')
map('v', '<leader>p', '"_dP')

-- Disable arrow keys
map('i', '<Up>', '<Nop>')
map('i', '<Down>', '<Nop>')
map('i', '<Left>', '<Nop>')
map('i', '<Right>', '<Nop>')
map('n', '<Up>', '<Nop>')
map('n', '<Down>', '<Nop>')
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')
map('n', 'h', '<Nop>')
map('n', 'l', '<Nop>')

-- Move text
map('n', 'K', ':move \'<-2<cr>gv=gv\'')
map('n', 'J', ':move \'>+1<cr>gv=gv\'')
map('v', 'K', ':move \'<-2<cr>gv=gv\'')
map('v', 'J', ':move \'>+1<cr>gv=gv\'')

-- Commenting
map('n', '<leader>/', 'gcc')
map('v', '<leader>/', 'gb')

--"SELECT ALL
--nnoremap <leader>a gg<S-v>G

--"MOVE TEXT
--vnoremap <C-j> :m '>+1<cr>gv=gv
--vnoremap <C-k> :m '<-2<cr>gv=gv
--inoremap <C-j> <esc>:m .+1<cr>==
--inoremap <C-k> <esc>:m .-2<cr>==
--"nnoremap <C-j> :m .+1<cr>==
--"nnoremap <C-k> :m .-2<cr>==

--"UNDO POINTS
--inoremap , ,<C-g>u
--inoremap . .<C-g>u
--inoremap ! !<C-g>u
--inoremap ? ?<C-g>u
