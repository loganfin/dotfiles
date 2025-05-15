local config = {
    --update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "single",
		source = "always",
		header = "",
		prefix = "",
		suffix = "",
	},
}

vim.diagnostic.config(config)

local function opt(desc)
	return vim.tbl_extend("force", opts, { desc = desc })
end

vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "single", max_height = 30, max_width = 120 })
end)
--[[
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "<C-Space>", "<C-x><C-o>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "gq", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)

		vim.keymap.set("n", "grt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "grd", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	end,
})
--]]

vim.lsp.enable("clangd")
vim.lsp.enable("luals")
