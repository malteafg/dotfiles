local status_ok, nest = pcall(require, "nest")
if not status_ok then return end

local function map(mode, lhs, rhs, opts)
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
map('n', '<c-i>', '<nop>')
map('v', '<c-i>', '<nop>')

nest.applyKeymaps {
  { '<leader>', {
    { 'h', '<cmd>set hlsearch!<cr>' },
    { 'e', '<cmd>Neotree toggle<cr>' },
    { '/', function() require("Comment.api").toggle.linewise.current() end },
    { '/', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", mode = 'v' },

    -- Window controls
    { 'w', mode = 'nv', {
      { 'h', '<c-w><c-h>' },
      { 'i', '<c-w><c-l>' },
      { 'n', '<c-w><c-j>' },
      { 'e', '<c-w><c-k>' },
      { 't', '<cmd>Neotree focus<cr>'},
      { '', '<c-w>' },
    }},

    -- Buffer controls
    { 'b', mode = 'nv', {
        { 'e', '<cmd>BufferLinePick<cr>' },
        { 'c', '<cmd>BufferLinePickClose<cr>' },
        { 'q', '<cmd>BufferLineCloseLeft<cr>' },
        { 'l', '<cmd>BufferLineCloseRight<cr>' },
    }},

    -- Session manager
    { 'S', mode = 'nv', {
      { 'l', '<cmd>SessionManager! load_last_session<cr>' },
      { 's', '<cmd>SessionManager! save_current_session<cr>' },
      { 'd', '<cmd>SessionManager! delete_session<cr>' },
      { 'f', '<cmd>SessionManager! load_session<cr>' },
      { '.', '<cmd>SessionManager! load_current_dir_session<cr>' },
    }},

    -- Open lines
    { 'o', '<cmd>call append(line("."), repeat([""], v:count1))<cr>' },
    { 'O', '<cmd>call append(line(".") - 1, repeat([""], v:count1))<cr>' },

    -- System clipboard
    { 'y', '<s-v>"+y' },
    { 'p', '"+p' },
    { 'y', '"+y', mode = 'v' },
    { 'p', '"_dP', mode = 'v' },

    -- Space paste
    -- { 'p', '\"_dP', mode = 'v' },
  }},

  -- Buffer controls
    { 'S-', mode = 'nv', {
        { 'l', '<cmd>BufferLineCycleNext<cr>' },
        { 'h', '<cmd>BufferLineCyclePrev<cr>' },
    }},
    { mode = 'nv', {
        { '>b', '<cmd>BufferLineMoveNext<cr>' },
        { '<b', '<cmd>BufferLineMovePrev<cr>' },
    }},

  -- Normal mode only bindings
  { mode = 'n', {
    { 'Y', 'y$' },

    { 'n', 'nzzzv' },
    { 'N', 'Nzzzv' },
    { 'J', 'mzJ`z' },

    -- Move text
    { 'K', '<cmd>m .+1<cr>==' },
    { 'J', '<cmd>m .-2<cr>==' },
  }},
  
  -- Visual mode only bindings
  { mode = 'n', {
    -- Move text
    { 'K', '<cmd>m \'>+1<cr>gv=gv' },
    { 'J', '<cmd>m \'<-2<cr>gv=gv' },
  }},

  -- Disable arrow keys
  { mode = 'ni', {
    { '<up>', '<nop>' },
    { '<down>', '<nop>' },
    { '<left>', '<nop>' },
    { '<right>', '<nop>' },
  }},
}
