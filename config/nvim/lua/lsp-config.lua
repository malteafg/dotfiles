-- LSP setup
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

-- lsp.configure('rust-analyzer', {
--   settings = {
--     ["rust-analyzer"] = {
--       inlayHints_chainingHints = true,
--     }
--   }
-- })
