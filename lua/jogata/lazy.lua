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
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup()
        end
    },
    
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false
    },

    {
        "HiPhish/rainbow-delimiters.nvim"
    },

    {
        'm4xshen/autoclose.nvim'
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- {
    --     "karb94/neoscroll.nvim"
    -- },

	-- {
	-- 	'mbbill/undotree',
	-- 	lazy = false
	-- },

	-- {
	-- 	'tpope/vim-fugitive',
	-- 	lazy = false
	-- },

    -- {
    --     'stevearc/dressing.nvim'
    -- },

	-- r plugins
	{
		"R-nvim/cmp-r"
	},

	{
		"R-nvim/R.nvim",
		lazy = false,
        config = function()
            bracketed_paste = true
            local opts = {
                R_args = {"--quiet", "--no-save"},
                hook = {
                    on_filetype = function ()
                        vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
                        vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
                    end
                },
                min_editor_width = 72,
                rconsole_width = 80,
                disable_cmds = {
                    "RClearConsole",
                    "RCustomStart",
                    "RSPlot",
                    "RSaveClose",
                },
            }
            if vim.env.R_AUTO_START == "true" then
                opts.auto_start = 1
                opts.objbr_auto_start = true
            end
            require("r").setup(opts)
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

    -- {
    --     "rebelot/kanagawa.nvim"
    -- },
    --
    -- {
    --     "Shatur/neovim-ayu"
    -- },
    --
    -- {
    --     "sainnhe/gruvbox-material"
    -- },
    --
    
    {
        "Mofiqul/dracula.nvim"
    },

    {
        "Tsuzat/NeoSolarized.nvim"
    },

    {
        "loctvl842/monokai-pro.nvim"
    },

    {
        "nyoom-engineering/oxocarbon.nvim"
    },

    {
        "AlexvZyl/nordic.nvim"
    }

    -- {
    --     "catppuccin/nvim"
    -- }


})
