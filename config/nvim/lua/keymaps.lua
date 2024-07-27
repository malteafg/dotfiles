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
map('n', '<enter>', '<nop>')
vim.g.maplocalleader = '_'

nest.applyKeymaps {
  {
    { 'r', function() require("flash").remote() end, mode = 'o' },
  },
  { '<leader>', {
    { 'b', '<cmd>set hlsearch!<cr>' },
    { 'e', '<cmd>Neotree toggle<cr>' },
    -- { 't', '<cmd>Neotree focus<cr>' },
    { 'c', '<cmd>lua vim.lsp.buf.format()<cr><cmd>w<cr>' },
    { 'l', 'gwip' },
    { 'q', '<cmd>q<cr>' },
    { 'g', '<cmd>Git<cr>' },
    { '/', function() require("Comment.api").toggle.linewise.current() end },
    { '/', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", mode = 'v' },
    { 'x', function() require("flash").treesitter() end, mode = 'nxo' },

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
        { 'o', '<c-w><c-l>' },
        { 'n', '<c-w><c-j>' },
        { 'e', '<c-w><c-k>' },
        { 'w', '<c-w>w' },
        { 'i', '<c-w>o' },
        { 's', '<c-w>s' },
        { 'v', '<c-w>v' },
        -- Window movement
        { 'r', '<c-w>r' },
        { 'R', '<c-w>R' },
        { 'x', '<c-w>x' },
        -- Resizing
        { '=', '<c-w>=' },
        { '-', '<c-w>-' },
        { '_', '<c-w>+' },
        { 'u', '<c-w><' },
        { 'y', '<c-w>>' },
        -- { '_', '<c-w>_' },
        -- { '|', '<c-w>|' },
      }
    },

    -- Buffer controls
    {
      'h',
      mode = 'nv',
      {
        { 's', function() require("telescope.builtin").buffers() end },
        { 'x', function() require("telescope.actions").delete_buffer() end },
        { 'r', '<cmd>Bdelete<cr>' },
        { 'i', '<cmd>b#<cr>'},
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

    -- Telescope
    {
      'f',
      mode = 'nv',
      {
        { 'f', function() require("telescope.builtin").find_files() end },
        { 'F', function() require("telescope.builtin").find_files({hidden=true, no_ignore=true}) end },
        { 'g', function() require("telescope.builtin").git_files() end },
        { 'r', function() require("telescope.builtin").registers() end },
        { 'c', function() require("telescope.builtin").commands() end },
        { 's', function() require("telescope.builtin").grep_string() end },
        { 'S', function() require("telescope.builtin").live_grep() end },
        { 't', function() require("flash").toggle() end },
      }
    },

    -- Tabs
    {
      't',
      mode = 'nv',
      {
        { 'u', 'gT' },
        { 'y', 'gt' },
        { 'n', '<cmd>tabnew<cr>' },
        { 'c', '<cmd>tabclose<cr>' },
        { 'w', '<C-w>T' },
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
    }
  },

  -- Visual mode only bindings
  {
    mode = 'v',
    {
      -- Move text
      { '<c-k>', ":m '<-2<cr>gv=gv" },
      { '<c-j>', ":m '>+1<cr>gv=gv" },
    }
  },

  -- Disable arrow keys
  {
    mode = 'nvi',
    {
      { '<up>',    '<nop>' },
      { '<down>',  '<nop>' },
      { '<left>',  '<nop>' },
      { '<right>', '<nop>' },
    }
  },
  {
    mode = 'nv',
    {
      { 'h', '<nop>' },
      -- { 'j', '<nop>' },
      -- { 'k', '<nop>' },
      { 'l', '<nop>' },
    }
  },
}
