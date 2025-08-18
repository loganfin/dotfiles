return {
	"stevearc/oil.nvim",
	opts = {},
	lazy = false,
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = true,
			},
			columns = { "permissions", "size" },
			skip_confirm_for_simple_edits = true,
		})

		vim.keymap.set(
			"n",
			"<leader>pv",
			"<CMD>Oil<CR>",
			{ desc = "Open the file explorer" }
		)
	end,
}

-- TODO: better navigation
-- TODO: more sensible confirmation prompts (i.e. no need confirm when making new file)
