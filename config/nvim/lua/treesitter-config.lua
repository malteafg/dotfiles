local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then return end

vim.g.skip_ts_context_commentstring_module = true

treesitter.setup({
  ensure_installed = {},
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'org' },
  },
  rainbow = {
    enable = true,
    disable = { "html" },
    extended_mode = false,
    max_file_lines = nil,
  },
  autopairs = { enable = true },
  autotag = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = false },
})
