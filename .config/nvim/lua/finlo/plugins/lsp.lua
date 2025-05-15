return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
	},
}
--[[
return {
	-- lsp
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			-- setup lsp_zero
			lsp_zero.on_attach(function(_, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
				vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
			end)

			lsp_zero.set_preferences({
				sign_icons = {
					error = "E",
					warn = "W",
					hint = "H",
					info = "I",
				},
			})

			-- setup mason/mason-lspconfig
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					-- language servers
					"clangd",
					"lua_ls",
					"tsserver",
					"eslint",
					-- formatters
					--"clang-format",
					--"black",
					--"isort",
					--"prettierd",
					--"codespell",
					--"stylua",
				},
				handlers = {
					lsp_zero.default_setup,
					-- fix Undefined global 'vim'
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
			})

			-- "ensure_installed" for non-lsp mason tools
			local registry = require("mason-registry")

			for _, pkg_name in ipairs({
				"clang-format",
				"black",
				"isort",
				"prettierd",
				"stylua",
				"codespell",
			}) do
				local ok, pkg = pcall(registry.get_package, pkg_name)
				if ok then
					if not pkg:is_installed() then
						print(string.format("[mason] Installing tool: %s", pkg_name))
						pkg:install()
						print(string.format("[mason] Installed tool: %s", pkg_name))
					end
				else
					print(
						string.format("[mason] Failed to install tool: %s; not found in the mason registry", pkg_name)
					)
				end
			end

			-- setup cmp
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lua" },
					{ name = "luasnip", keyword_length = 2 },
					{ name = "buffer", keyword_length = 3 },
				},
				-- Display where the cmp suggestion came from ([LSP], [buffer], ...)
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					-- disable tab completion
					["<Tab>"] = nil,
					["<S-Tab>"] = nil,
				}),
				-- disable cmp by default (I hate the popup window)
				enabled = false,
				-- I'm not sure what this does
				window = {
					completion = cmp.config.window.bordered(),
				},
			})

			-- keymaps to enable/disable cmp on demand
			vim.keymap.set("n", "<leader>co", function()
				print("cmp enabled")
				require("cmp").setup.buffer({ enabled = true })
			end)
			vim.keymap.set("n", "<leader>cf", function()
				require("cmp").setup.buffer({ enabled = false })
				print("cmp disabled")
			end)
		end,
	},
}
--]]
