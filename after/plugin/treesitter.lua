require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"markdown",
		"markdown_inline",
		"r",
		"rnoweb",
		"bash",
		"lua",
		"python",
		"vim"
	},

	auto_install = true,

	highlight = {
		enable = true
	}
})
