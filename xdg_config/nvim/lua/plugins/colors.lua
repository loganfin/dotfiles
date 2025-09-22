return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	config = function()
		local gruvbox = require("gruvbox")

		gruvbox.setup({
			contrast = "hard",
			-- I don't like the italics too much
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},

			overrides = {
				-- Transparent signcolumn
				SignColumn = { bg = "none" },
			},
		})

		-- This seems to be the default, but just to be safe...
		vim.o.background = "dark"

		vim.cmd.colorscheme("gruvbox")

		-- Highlight trailing whitespace
		vim.cmd([[
            highlight ExtraWhitespace ctermbg=240 guibg=#FFD9D9
            match ExtraWhitespace /\s\+$/
            au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
            au InsertLeave * match ExtraWhitespace /\s\+$/
        ]])
	end,
}

