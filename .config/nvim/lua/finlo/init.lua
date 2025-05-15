require("finlo.remaps")
require("finlo.sets")
require("finlo.terminal")
require("finlo.netrw")

-- LSP
vim.lsp.enable('clangd')
vim.lsp.enable('luals')
require("finlo.lsp")

-- load last to prevent breakage
require("finlo.lazy")
