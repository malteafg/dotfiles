local status_ok, feline = pcall(require, "feline")
if not status_ok then return end

feline.setup({
  disable = { filetypes = { "^NvimTree$", "^neo%-tree$", "^dashboard$", "^Outline$", "^aerial$" } },
})
