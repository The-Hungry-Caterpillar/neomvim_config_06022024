local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({


	-- essential plugins

	{ 
		"nvim-telescope/telescope.nvim",
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	},

	{
		"theprimeagen/harpoon",
		lazy = false
	},

	{
		'mbbill/undotree',
		lazy = false
	},

	{
		'tpope/vim-fugitive',
		lazy = false
	},
    
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false
    },

    {
        'stevearc/dressing.nvim'
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = { 'BufReadPre', 'BufNewFile'},
        opts = {
            indent = { char = "|" }
        }
    },


	-- r plugins
	{
		"R-nvim/cmp-r"
	},

	{
		"R-nvim/R.nvim",
		lazy = false,
        config = function()
            bracketed_paste = true
        end
	},

	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp").setup({ sources = {{ name = "cmp_r" }}})
			require("cmp_r").setup({ })
		end,
	},


	-- color themes

	{ 
		"rose-pine/neovim",
		name = "rose-pine"
	},

    {
        "olimorris/onedarkpro.nvim"
    },

    {
        "tiagovla/tokyodark.nvim"
    },
    
    {
        "sainnhe/gruvbox-material"
    },

    {
        "rebelot/kanagawa.nvim"
    }




})
