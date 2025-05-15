-- This allows forces line-breaking in markdown files only
local wrap_markdown = function()
	if vim.bo.filetype == "markdown" then
		return { "--prose-wrap=always" }
	end
end

return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		local util = require("conform.util")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				css = { "prettierd" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				json = { "prettierd" },
				markdown = { "prettierd" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				cpp = { "clang_format" },
				c = { "clang_format" },
			},
			formatters = {
				black = {
					command = "black",
					args = {
						"--stdin-filename",
						"$FILENAME",
						"--quiet",
						"-",
						"--line-length",
						"80",
					},
					cwd = util.root_file({
						-- https://black.readthedocs.io/en/stable/usage_and_configuration/the_basics.html#configuration-via-a-file
						"pyproject.toml",
					}),
				},
				prettierd = {
					prepend_args = wrap_markdown,
				},
				prettier = {
					prepend_args = wrap_markdown,
				},
				stylua = {
					prepend_args = { "--column-width=80" },
				},
			},
		})

		-- add keybind to format selection
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({ lsp_fallback = true })
		end)
	end,
}
