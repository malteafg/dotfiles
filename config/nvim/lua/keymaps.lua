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
    { 'b', '<cmd>set hlsearch!<cr>' },
    { 'e', '<cmd>Neotree toggle<cr>' },
    { 't', '<cmd>Neotree focus<cr>' },
    { 'c', '<cmd>lua vim.lsp.buf.format()<cr><cmd>w<cr>' },
    { 'q', 'gwip' },
    { '/', function() require("Comment.api").toggle.linewise.current() end },
    { '/', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", mode = 'v' },

    -- Window controls
    {
      'w',
      mode = 'nv',
      {
        { 'p', function()
          local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
          vim.api.nvim_set_current_win(picked_window_id)
        end },
        -- Movement
        { 'h', '<c-w><c-h>' },
        { 'i', '<c-w><c-l>' },
        { 'n', '<c-w><c-j>' },
        { 'e', '<c-w><c-k>' },
        { 'o', '<c-w>o' },
        -- Window movement
        { 'r', '<c-w>r' },
        { 'R', '<c-w>R' },
        { 'x', '<c-w>x' },
        -- Resizing
        { '=', '<c-w>=' },
        { '-', '<c-w>-' },
        { '+', '<c-w>+' },
        { '>', '<c-w>>' },
        { '<', '<c-w><' },
        { '_', '<c-w>_' },
        { '|', '<c-w>|' },
      }
    },

    -- Buffer controls
    {
      'h',
      mode = 'nv',
      {
        { 'e', '<cmd>BufferLinePick<cr>' },
        { 'c', '<cmd>BufferLinePickClose<cr>' },
        { 'q', '<cmd>BufferLineCloseLeft<cr>' },
        { 'l', '<cmd>BufferLineCloseRight<cr>' },
        { 's', function() require("telescope.builtin").buffers() end },
        { 'U', '<cmd>BufferLineMovePrev<cr>' },
        { 'Y', '<cmd>BufferLineMoveNext<cr>' },
        { 'u', '<cmd>BufferLineCyclePrev<cr>' },
        { 'y', '<cmd>BufferLineCycleNext<cr>' },
        { 'r', '<cmd>Bdelete<cr>' },
      }
    },

    -- Session manager
    {
      's',
      mode = 'nv',
      {
        { 'l', '<cmd>SessionManager! load_last_session<cr>' },
        { 's', '<cmd>SessionManager! save_current_session<cr>' },
        { 'q', '<cmd>SessionManager save_current_session<cr><cmd>qa<cr>' },
        { 'd', '<cmd>SessionManager! delete_session<cr>' },
        { 'f', '<cmd>SessionManager! load_session<cr>' },
        { '.', '<cmd>SessionManager! load_current_dir_session<cr>' },
      }
    },

    -- Files
    {
      'f',
      mode = 'nv',
      {
        { 'f', function() require("telescope.builtin").find_files() end },
        { 'p', function() require("telescope.builtin").registers() end },
        { 'c', function() require("telescope.builtin").grep_string() end },
        { 'w', function() require("telescope.builtin").live_grep() end },
      }
    },

    -- Git
    {
      'g',
      mode = 'nv',
      {
        { 's', function() require("telescope.builtin").git_status() end },
        { 'b', function() require("telescope.builtin").git_branches() end },
        { 'c', function() require("telescope.builtin").git_commits() end },
      }
    },

    -- Open lines
    { 'o', '<cmd>call append(line("."), repeat([""], v:count1))<cr>' },
    { 'O', '<cmd>call append(line(".") - 1, repeat([""], v:count1))<cr>' },

    -- System clipboard
    { 'y', '<s-v>"+y' },
    { 'p', '"+p' },
    {
      mode = 'v',
      {
        { 'y', '"+y' },
        { 'p', '"_dP' },
      }
    }
  } },

  -- Normal mode only bindings
  {
    mode = 'n',
    {
      { 'Y',     'y$' },

      { 'n',     'nzzzv' },
      { 'N',     'Nzzzv' },
      { 'J',     'mzJ`z' },

      -- Move text
      { '<c-k>', '<cmd>m .-2<cr>==' },
      { '<c-j>', '<cmd>m .+1<cr>==' },

      { '<c-e>', '],wvi,'},
      { '<c-n>', '[,bvi,'},
    }
  },

  -- Visual mode only bindings
  {
    mode = 'v',
    {
      -- Move text
      { '<c-k>', ":m '<-2<cr>gv=gv" },
      { '<c-j>', ":m '>+1<cr>gv=gv" },

      { '<c-e>', '<esc>],wvi,'},
      { '<c-n>', '<esc>[,bvi,'},
    }
  },

  -- Disable arrow keys
  {
    mode = 'ni',
    {
      { '<up>',    '<nop>' },
      { '<down>',  '<nop>' },
      { '<left>',  '<nop>' },
      { '<right>', '<nop>' },
    }
  },
}
