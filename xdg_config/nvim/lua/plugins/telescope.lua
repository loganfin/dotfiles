local get_buffer_dir = function()
	local utils = require("telescope.utils")
	local buffer_dir = utils.buffer_dir()

	-- Oil buffers put "oil:///" at the front which causes telescope to fail
	if string.sub(buffer_dir, 1, 7) == "oil:///" then
		local oil = require("oil")
		return oil.get_current_dir()
	end

	return buffer_dir
end

return {
	"nvim-telescope/telescope.nvim",
	--tag = "0.1.9",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
		"princejoogie/dir-telescope.nvim",
		"oil.nvim",
	},
	config = function()
		require("telescope").setup({
			extensions = {
				fzf = {},
				live_grep_args = {
					mappings = {
						i = {
							["<C-k>"] = require(
								"telescope-live-grep-args.actions"
							).quote_prompt(),
							-- TODO: Determine if this one is necessary.
							["<C-i>"] = require(
								"telescope-live-grep-args.actions"
							).quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
			},
		})

		require("telescope").load_extension("live_grep_args")
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("dir")

		local builtin = require("telescope.builtin")
		local dir_extension = require("telescope").extensions.dir
		local live_grep_extension =
			require("telescope").extensions.live_grep_args

		vim.keymap.set("n", "<leader>pg", function()
			vim.fn.system("git rev-parse --is-inside-work-tree")
			if vim.v.shell_error == 0 then
				builtin.git_files()
			else
				builtin.find_files()
			end
		end, {
			desc = "Try to browse git files. Falls back to browsing all files if outside of git work tree",
		})

		vim.keymap.set(
			"n",
			"<leader>pf",
			builtin.find_files,
			{ desc = "Browse all files in the work directory" }
		)

		vim.keymap.set(
			"n",
			"<leader>pdf",
			dir_extension.find_files,
			{ desc = "Browse all files within a chosen directory" }
		)

		vim.keymap.set(
			"n",
			"<leader>pcf",
			function()
				builtin.find_files({ cwd = get_buffer_dir() })
			end,
			{ desc = "Browse all files within the current buffer's directory" }
		)

		vim.keymap.set(
			"n",
			"<leader>ps",
			--builtin.live_grep,
			live_grep_extension.live_grep_args,
			{ desc = "File grep within the current working directory" }
		)
		vim.keymap.set(
			"n",
			"<leader>pds",
			dir_extension.live_grep,
			{ desc = "File grep within a chosen directory" }
		)
		vim.keymap.set("n", "<leader>pcs", function()
			builtin.live_grep({ cwd = get_buffer_dir() })
		end, { desc = "File grep within the current buffer's directory" })

		vim.keymap.set(
			"n",
			"<leader>pk",
			builtin.keymaps,
			{ desc = "Browse keymaps" }
		)

		vim.keymap.set(
			"n",
			"<leader>ph",
			builtin.help_tags,
			{ desc = "Browse nvim help pages" }
		)

		vim.keymap.set(
			"n",
			"<leader>pm",
			builtin.man_pages,
			{ desc = "Browse installed man pages" }
		)
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
--    TODO:Ripgrep search with improved search domain (i.e. specify which directories to look in, file types, etc)
--        ps
-- x  Option to do any of the above searches from current buffer's directory
--        pc* (current)
--
--  TODO: Browse directories and open up chosen directory in oil
