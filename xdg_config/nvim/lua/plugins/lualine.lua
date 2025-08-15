return {
	"nvim-lualine/lualine.nvim",
    dependencies = { "oil.nvim" },
	config = function()
        -- TODO: Figure out how to get the buffer title to be the oil path
        -- local custom_buffers = require("lualine.components.buffers.buffer"):extend()

        local oil_or_filename = require('lualine.components.filename'):extend()

        -- Set the tabline to be the title of the file or the path to the
        -- directory if in an oil buffer.
        function oil_or_filename:update_status()
            local data = oil_or_filename.super.update_status(self)

            local filetype = vim.bo.filetype
            if filetype == "oil" then
                local ok, oil = pcall(require, "oil")
                if ok then
                    return vim.fn.fnamemodify(oil.get_current_dir(), ":~")
                else
                    return ""
                end
            end

          return data
        end

		require("lualine").setup({
			options = {
				icons_enabled = false,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			tabline = {
				lualine_a = { oil_or_filename },
				lualine_z = { "tabs" },
			},
            extensions = { oil_extension },
		})
	end,
}
