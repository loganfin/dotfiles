return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-context", opts = {} },
	-- Some config changes happened after this version which require reconfiguration.
	tag = "v0.10.0",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "cpp", "lua", "go" },
			auto_install = true,
			highlight = {
				enable = true,
			},
		})
	end,
}
