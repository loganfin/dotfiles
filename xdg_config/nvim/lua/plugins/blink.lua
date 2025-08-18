local completion_enabled = false

return {
	"saghen/blink.cmp",
	version = "1.*",

	dependencies = { "rafamadriz/friendly-snippets" },

	config = function()
		require("blink.cmp").setup({
			completion = {
				menu = {
					-- Disable completion by default. Open the menu by pressing c-space.
					auto_show = function()
						return completion_enabled
					end,
				},
			},
			signature = { enabled = true },
		})

		vim.keymap.set("n", "<leader>ct", function()
			completion_enabled = not completion_enabled
			if completion_enabled then
				print("completion enabled")
			else
				print("completion disabled")
			end
		end, { desc = "Toggle auto showing of the completion menu" })
	end,
}
