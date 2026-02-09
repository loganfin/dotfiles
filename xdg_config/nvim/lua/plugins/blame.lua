return {
	{
		"FabijanZulj/blame.nvim",
		lazy = false,
		config = function()
			require("blame").setup({})

			vim.keymap.set(
				"n",
				"<leader>bw",
				"<CMD>BlameToggle window<CR>",
				{ desc = "Display git blame via a window" }
			)

			vim.keymap.set(
				"n",
				"<leader>bv",
				"<CMD>BlameToggle virtual<CR>",
				{ desc = "Display git blame via virtual text" }
			)
		end,
	},
}
