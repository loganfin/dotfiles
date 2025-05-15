return {
	--"mason-org/mason.nvim",
	"andreihh/mason.nvim",
	branch = "ensure_installed",
	opts = {
		ensure_installed = {
			-- LSPs
			"lua-language-server",
			"clangd",
			-- Formatters
			"clang-format",
			"isort",
			"black",
			"prettierd",
			"stylua",
		},
	},
}
