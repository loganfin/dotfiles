vim.g.mapleader = " "

-- center cursor after <c-d> and <c-u>
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

-- center cursor when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- zoom in current buffer
vim.keymap.set("n", "<a-z>", "<c-w><bar><c-w>_")

-- equalize buffer spacing
vim.keymap.set("n", "<a-=>", "<c-w>=")

-- split navigation
vim.keymap.set("n", "<a-h>", "<c-w>h")
vim.keymap.set("n", "<a-j>", "<c-w>j")
vim.keymap.set("n", "<a-k>", "<c-w>k")
vim.keymap.set("n", "<a-l>", "<c-w>l")

-- terminal naviagtion
vim.keymap.set("t", "<esc>", [[<c-\><c-n>]])
vim.keymap.set("t", "<a-=>", "<c-w>=")
vim.keymap.set("t", "<a-z>", "<c-w><bar><c-w>_")
vim.keymap.set("t", "<a-h>", "<c-w>h")
vim.keymap.set("t", "<a-j>", "<c-w>j")
vim.keymap.set("t", "<a-k>", "<c-w>k")
vim.keymap.set("t", "<a-l>", "<c-w>l")

-- yank to the system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- paste without changing the content of the copy buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- delete without changing the content of the copy buffer
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("v", "<", "<gv", { desc= "Indent left and select" })
vim.keymap.set("v", ">", ">gv", { desc= "Indent right and select" })
