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

-- Remap space as leader key
-- Must be before lazy
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

require("lazy").setup({
	-- actual plugins list
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
		config = function()
			require("config.telescope")
		end,
	},
	"jvgrootveld/telescope-zoxide",
	"crispgm/telescope-heading.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"vv9k/vim-github-dark",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"kevinhwang91/nvim-bqf",
		dependencies = {
			{ "junegunn/fzf", module = "nvim-bqf" },
		},
	},
	{
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
		},
		config = function()
			require("config.diffview")
		end,
	},
	{
		"TimUntersberger/neogit",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Neogit",
		config = function()
			require("config.neogit")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("config.lualine")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("config.gitsigns")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	},
	"nvim-treesitter/nvim-treesitter-textobjects",
	{
		"ray-x/go.nvim",
		ft = { "go" },
		config = function()
			require("config.go")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lsp")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("config.lsp-signature")
		end,
	},
	{
		"onsails/lspkind-nvim",
		dependencies = { "famiu/bufdelete.nvim" },
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "lukas-reineke/cmp-rg" } },
		},
		config = function()
			require("config.cmp")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = "saadparwaiz1/cmp_luasnip",
		config = function()
			require("config.luasnip")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("config.autopairs")
		end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			require("config.which")
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("config.null-ls")
		end,
	},
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("config.nvim-tree")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("config.harpoon")
		end,
	},
	{
		"akinsho/nvim-bufferline.lua",
		dependencies = "kyazdani42/nvim-web-devicons",
		event = "BufReadPre",
		config = function()
			require("config.bufferline")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("config.comment")
		end,
	},
	{},
	{
		"cuducos/yaml.nvim",
		ft = { "yaml" },
	},
	{
		"willothy/flatten.nvim",
		config = function()
			require("config.flatten")
		end,
	},
})
