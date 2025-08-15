local ensure_installed = function(packages)
    local Command = require("mason.api.command")
    local Package = require("mason-core.package")
    local Registry = require("mason-registry")

    packages_to_install = {}
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
			-- Formatters
			"clang-format",
			"isort",
			"black",
			"prettierd",
			"stylua",
		})
    end
}

--[[
    local Command = require "mason.api.command"
    setup_autocmds()

    local Package = require "mason-core.package"
    local pkgs_to_install = {}
    for _, pkg_identifier in ipairs(settings.current.ensure_installed or {}) do
        local pkg_name, _ = Package.Parse(pkg_identifier)
        local ok, pkg = pcall(Registry.get_package, pkg_name)
        if ok and not pkg:is_installed() and not pkg:is_installing() then
            table.insert(pkgs_to_install, pkg_identifier)
        end
    end
    if not vim.tbl_isempty(pkgs_to_install) then
        Command.MasonInstall(pkgs_to_install)
    end
--]]
