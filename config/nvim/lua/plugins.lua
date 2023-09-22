local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Basic plugins
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim" }  -- Useful lua functions used by lots of plugins
  use { "LionC/nest.nvim" }        -- For defining key mappings
  use { "lewis6991/impatient.nvim" }

  -- Auto pairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,
  }

  use {
    "vimwiki/vimwiki",
  }

  -- Tree file manager
  use { "kyazdani42/nvim-web-devicons" }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    module = "neo-tree",
    cmd = "Neotree",
    requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
    setup = function() vim.g.neo_tree_remove_legacy_commands = true end,
    config = function() require "neo-tree-config" end,
  }

  -- Window picker
  use {
    "s1n7ax/nvim-window-picker",
    tag = 'v1.*',
    config = function()
      require "window-picker".setup({
        selection_chars = 'ASRTNEIOCLUY'
      })
    end,
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function() require "treesitter-config" end,
  }
  use {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter"
  }

  -- Scala
  use { 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    module = "telescope",
    config = function() require "telescope-config" end,
  }

  -- Comment
  use {
    "numToStr/Comment.nvim",
    module = { "Comment", "Comment.api" },
    keys = { "gc", "gb", "g<", "g>" },
    config = function() require "comment-config" end,
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter"
  }

  -- Bufferline
  use {
    "akinsho/bufferline.nvim",
    after = "nvim-web-devicons",
    config = function() require "bufferline-config" end,
  }
  use {
    "feline-nvim/feline.nvim",
    after = "nvim-web-devicons",
    config = function() require "feline-config" end,
  }

  -- Indentation
  use { "lukas-reineke/indent-blankline.nvim" }
  use {
    "Darazaki/indent-o-matic",
    config = function()
      require('indent-o-matic').setup({
        standard_widths = { 2, 4 },
        filetype_lua = {
          standard_widths = { 2 },
        },
      })
    end
  }

  -- Latex
  use { "lervag/vimtex" }

  -- Colorschemes
  use 'bluz71/vim-nightfly-guicolors'
  --  use { "folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb" }
  --  use { "lunarvim/darkplus.nvim", commit = "2584cdeefc078351a79073322eb7f14d7fbb1835" }
  use {
    "stevearc/dressing.nvim",
    event = "VimEnter",
    config = function() require('dressing-config') end,
  }

  -- Session manager
  use {
    "Shatur/neovim-session-manager",
    -- module = "session_manager",
    -- cmd = "SessionManager",
    -- event = "BufWritePost",
    -- config = function() require('session_manager').setup() end,
    config = function()
      require('session_manager').setup({
        -- Possible values: Disabled, CurrentDir, LastSession
        autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
      })
    end,
  }

  -- Surround
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }

  -- LSP stuff
  use {
    "onsails/lspkind.nvim",
    module = "lspkind",
    config = function() require "lspkind-config" end,
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }

  use {
    'simrat39/rust-tools.nvim',
    config = function()
      require('rust-tools').setup()
    end,
  }

  use { "jose-elias-alvarez/null-ls.nvim", lazy = true }

  -- Git stuff
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
