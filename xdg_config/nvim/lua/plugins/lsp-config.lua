-- TODO: The formatting needs some work fo sho
return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.enable({ "lua_ls" })

        vim.lsp.config("lua_ls", {})
        vim.lsp.config("lua_ls",
            {
                filetypes = { 'lua' },
                settings = {
                    Lua = {
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true)
                        }
                    }
                }
            })

        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
    end
}
