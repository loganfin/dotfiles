local ensure_installed = function(packages)
    local Command = require("mason.api.command")
    local Package = require("mason-core.package")
    local Registry = require("mason-registry")

    local packages_to_install = {}
    for _, package_identifier in ipairs(packages or {}) do
        local package_name, _ = Package.Parse(package_identifier)
        local ok, package_ = pcall(Registry.get_package, package_name)
        if ok and not package_:is_installed() and not package_:is_installing() then
            table.insert(packages_to_install, package_identifier)
        end
    end

    if not vim.tbl_isempty(packages_to_install) then
        Command.MasonInstall(packages_to_install)
    end
end

return {
	"mason-org/mason.nvim",
    config = function()
        require("mason").setup()
        ensure_installed({
			-- LSPs
			"lua-language-server",
			"clangd",
            "pyright",
            "gopls",
			-- Formatters

			"clang-format",
			"isort",
			"black",
			"prettierd",
			"stylua",
		})
    end
}
