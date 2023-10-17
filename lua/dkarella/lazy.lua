local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- @TODO: move this to other files?
require("lazy").setup({
	"folke/which-key.nvim",
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
	},
	"folke/neodev.nvim",
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	{
		'rose-pine/neovim',
		name = 'rose-pine',
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		opts = {
			--[[ things you want to change go here]]
		},
	},

	-- lsp-zero + mason
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	-- 

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			-- A list of parser names, or "all" (the four listed parsers should always be installed)
			ensure_installed = {
				"bash",
				"c",
				"comment",
				"css",
				"go",
				"vimdoc",
				"html",
				"http",
				"javascript",
				"json",
				"lua",
				"python",
				"zig",
				"typescript",
			},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,

			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		},
	},
})
