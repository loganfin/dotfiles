local get_buffer_dir = function()
    local utils = require("telescope.utils")
    local buffer_dir = utils.buffer_dir()

    -- Oil buffers put "oil:///" at the front which causes telescope to fail
    if string.sub( buffer_dir, 1, 7) == "oil:///" then
        local oil = require("oil")
        return oil.get_current_dir()
    end

    return buffer_dir
end

return {
	"nvim-telescope/telescope.nvim",
	--tag = "0.1.9",
    dependencies = { "nvim-lua/plenary.nvim", { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }, "princejoogie/dir-telescope.nvim", "oil.nvim"},
	config = function()
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('dir')

		local builtin = require("telescope.builtin")
		local dir_extension = require("telescope").extensions.dir

   	 -- Use git_files by default and find_files if git_files fails
		vim.keymap.set("n", "<leader>pg", function()
			vim.fn.system("git rev-parse --is-inside-work-tree")
			if vim.v.shell_error == 0 then
				builtin.git_files()
			else
				builtin.find_files()
			end
		end)

        vim.keymap.set("n", "<leader>pf", builtin.find_files)
		vim.keymap.set("n", "<leader>pdf", dir_extension.find_files, {})
		vim.keymap.set("n", "<leader>pcf", function()
            builtin.find_files({ cwd = get_buffer_dir() })
        end, {})

		vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>pds", dir_extension.live_grep, {})
		vim.keymap.set("n", "<leader>pcs", function()
            builtin.live_grep({ cwd = get_buffer_dir() })
        end, {})

		vim.keymap.set("n", "<leader>pk", builtin.keymaps , {})

		vim.keymap.set("n", "<leader>ph", builtin.help_tags, {})

		vim.keymap.set("n", "<leader>pm", builtin.man_pages, {})

	end,
}

--
-- x  Browse keymaps
--       pk (not comfortable on dvorak)
-- x  Browse help pages
--        ph
-- x   Browse git files
--        pg
-- x   Browse all files
--        pf
-- x  Browse directories (i.e. go to poky)
--        pd
--    Ripgrep search with improved search domain (i.e. specify which directories to look in, file types, etc)
--        ps
-- x  Option to do any of the above searches from current buffer's directory
--        pc* (current)
--
