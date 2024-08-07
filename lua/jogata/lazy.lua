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
		run = ":TSUpdate",
        lazy = true
	},
    
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false
    },

    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            -- 👇 in this section, choose your own keymappings!
            {
                "<leader>-",
                function()
                    require("yazi").yazi()
                end,
                desc = "Open the file manager",
            },
            {
                -- Open in the current working directory
                "<leader>cw",
                function()
                    require("yazi").yazi(nil, vim.fn.getcwd())
                end,
                desc = "Open the file manager in nvim's working directory" ,
            },
        },
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,

            -- enable these if you are using the latest version of yazi
            -- use_ya_for_events_reading = true,
            -- use_yazi_client_id_flag = true,

            keymaps = {
                show_help = '<f1>',
            },
        },
        config = function()
            require("yazi").setup()
        end
    },


    {
        "nvimdev/indentmini.nvim",
        config = function()
            require("indentmini").setup()
        end
    },

    {
        "ggandor/leap.nvim",
        config = function()
            local leap = require('leap')
            leap.add_default_mappings()
            leap.opts.case_sensitive = true
        end
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

    {
        "karb94/neoscroll.nvim"
    },

    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        },
    },

    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            insert_at_start = true,
        },
    },

    {
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    },

    -- {
    --     "miversen33/sunglasses.nvim"
    -- },
    --
	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup()
		end,
		keys = {
			{ "<leader>a", function() require("harpoon"):list():add() end },
			{ "<leader>o", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end },
			{ "<leader>1", function() require("harpoon"):list():select(1) end },
			{ "<leader>2", function() require("harpoon"):list():select(2) end },
			{ "<leader>3", function() require("harpoon"):list():select(3) end },
			{ "<leader>4", function() require("harpoon"):list():select(4) end },
			{ "<leader>5", function() require("harpoon"):list():select(5) end }
    -- vim.keymap.set("n", "<leader>d", ":<C-U>bprevious <bar> bdelete #<CR>")

		},

	},

	-- {
	-- 	'mbbill/undotree',
	-- 	lazy = false
	-- },

	-- {
	-- 	'tpope/vim-fugitive',
	-- 	lazy = false
	-- },

    {
        'stevearc/dressing.nvim'
    },

	-- r plugins
	{
		"R-nvim/cmp-r"
	},

	{
		"R-nvim/R.nvim",
		lazy = false,
        config = function()
            local opts = {
                bracketed_paste = true,
                -- external_term = "tmux split-window -h -l 70",
                R_args = {"--quiet", "--no-save"},
                hook = {
                    on_filetype = function ()
                        vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
                        vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
                    end
                },
                -- -- for vertical split
                -- min_editor_width = 72,
                -- rconsole_width = 70,
                -- for horizontal split
                rconsole_width = 0,
                rconsole_height = 20,
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

    {
        "slugbyte/lackluster.nvim"
    },

    {
        "Mofiqul/dracula.nvim",
        opts = {
            transparent_bg = true,
            italic_comment = true
        }
    },

    {
        "folke/tokyonight.nvim",
    },

    {
        "Shatur/neovim-ayu"
    },

    {
        "Everblush/nvim"
    },

    {
        "diegoulloao/neofusion.nvim",
        priority = 1000 ,
        config = true,
        opts = {
            transparent_mode = true
        }
    },

    {
        "Mofiqul/vscode.nvim",
        opts = {
            transparent_background = true
        }
    },

    {
        'sainnhe/everforest',
        lazy = false,
        priority = 1000,
        config = function()
            everforest_background = "soft"
        end

    },

    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = false
        },
    },
    
    {
        "rebelot/kanagawa.nvim"
    },

    {
        'maxmx03/solarized.nvim',
        lazy = false,
        priority = 1000,
        config = function()
        end,
    },



})
