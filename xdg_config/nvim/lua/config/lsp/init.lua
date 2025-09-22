-- Diagnostics
local config = {
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
	virtual_text = true,
}

vim.diagnostic.config(config)

-- Keymaps
--vim.keymap.set("n", "<C-Space>", "<C-x><C-o>")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		-- Besides these, just use the defaults
		vim.keymap.set(
			"n",
			"gd",
			vim.lsp.buf.definition,
			{ desc = "Goto definition", buffer = 0 }
		)
		vim.keymap.set(
			"n",
			"gD",
			vim.lsp.buf.declaration,
			{ desc = "Goto declaration", buffer = 0 }
		)
		vim.keymap.set(
			"n",
			"gr",
			vim.lsp.buf.references,
			{ desc = "List references in the quickfix list", buffer = args.buf }
		)
	end,
})

require("config.lsp.clangd")
require("config.lsp.go")
require("config.lsp.lua_ls")
require("config.lsp.pyright")
