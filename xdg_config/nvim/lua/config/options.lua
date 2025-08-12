-- Controls
vim.opt.mouse = "a"

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Text rendering
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8
-- TODO: folds?

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.winminheight = 0 -- allow for flush zoom-in of splits

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cino = "(gNN-s)" -- fix namespace indenting in c++
-- TODO: disable auto-insertion of comments on new line

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Visuals
vim.opt.showtabline = 2
vim.opt.guicursor = ""
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.showmode = false -- because status line displays current mode
vim.opt.termguicolors = true

-- Files
vim.opt.swapfile = false

-- Experimental
vim.opt.undofile = true
