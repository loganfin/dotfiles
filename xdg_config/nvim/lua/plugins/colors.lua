return {
	"gruvbox-community/gruvbox",
	version = "v2.2.0",
	lazy = false,
	config = function()
		vim.cmd.colorscheme("gruvbox")
		vim.g.gruvbox_contrast_dark = "soft"
		vim.opt.background = "dark"

		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

		-- highlight trailing whitespace
		vim.cmd([[
            highlight ExtraWhitespace ctermbg=240 guibg=#FFD9D9
            match ExtraWhitespace /\s\+$/
            au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
            au InsertLeave * match ExtraWhitespace /\s\+$/
        ]])
	end,
}
