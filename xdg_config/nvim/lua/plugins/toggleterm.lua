return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				float_opts = {
					border = "curved",
				},
			})

			-- Keymaps:
			-- - Open terminal in float, vertical, horizontal
			-- - Create a new terminal. Default orientation?
			-- - Create a new terminal in the current directory vs root of workspace

			vim.keymap.set(
				"n",
				"<leader>tt",
				"<CMD>ToggleTerm direction=float<CR>",
				{ desc = "" }
			)

			vim.keymap.set(
				"n",
				"<leader>th",
				"<CMD>ToggleTerm direction=horizontal<CR>",
				{ desc = "" }
			)

			vim.keymap.set(
				"n",
				"<leader>tv",
				"<CMD>ToggleTerm direction=vertical<CR>",
				{ desc = "" }
			)

			vim.api.nvim_create_autocmd("TermEnter", {
				pattern = "term://*toggleterm#*",
				callback = function(args)
					vim.keymap.set(
						"n",
						"q",
						"<CMD>ToggleTerm<CR>",
						{ buffer = args.buf, noremap = false }
					)
				end,
			})
		end,
	},
}
