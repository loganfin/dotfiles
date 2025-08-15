return {
  'stevearc/oil.nvim',
  opts = {},
  lazy = false,
  config = function()
      require("oil").setup({
        buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },
            view_options = {
                show_hidden = true,
            },
            --win_options = {
            --    winbar = "%{v:lua.require('oil').get_current_dir()}",
            --},
            columns = {"permissions", "size"}
        })

      vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>")
  end
}
