return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-context", opts = {} },
	-- Some config changes happened after this version which require reconfiguration.
	--tag = "v0.10.0",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup()
		ts.install({
			"c",
			"cpp",
			"lua",
			"go",
			"rust",
		})
	end,
	init = function()
		local pre_installed_parsers = {
			"c",
			"lua",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
		}

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local start_treesitter = function()
					vim.treesitter.start()
					vim.bo.indentexpr =
						"v:lua.require'nvim-treesitter'.indentexpr()"
				end

				local ts = require("nvim-treesitter")
				local lang = vim.treesitter.language.get_lang(args.match)
				if vim.list_contains(ts.get_available(), lang) then
					if
						not vim.list_contains(ts.get_installed(), lang)
						and not vim.list_contains(pre_installed_parsers, lang)
					then
						ts.install(lang):await(function()
							start_treesitter()
						end)
					else
						start_treesitter()
					end
				end
			end,
			desc = "Enable nvim-treesitter and install parser if not installed",
		})
	end,
}
