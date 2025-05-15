return {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
	root_markers = {
		".clang-tidy",
		".clang-format",
		".clangd",
		"compile_commands.json",
	},
}
