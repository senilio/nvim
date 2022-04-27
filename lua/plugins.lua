local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_config(name)
	return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	execute("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")

packer.init({
	enable = true, -- enable profiling via :PackerCompile profile=true
	threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
})

packer.startup(function(use)
	-- actual plugins list
	use("wbthomason/packer.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		config = get_config("lualine"),
		event = "VimEnter",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = [[require("config/indent-blankline")]],
	})
	use({
		"wojciechkepka/vim-github-dark",
		config = get_config("theme-github-dark"),
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		event = "BufReadPre",
		config = get_config("gitsigns"),
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		config = get_config("treesitter"),
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({ "ray-x/go.nvim", config = get_config("go"), ft = { "go" } })
	use({ "neovim/nvim-lspconfig", config = get_config("lsp") })
	use({
		"ray-x/lsp_signature.nvim",
		require = { "neovim/nvim-lspconfig" },
		config = get_config("lsp-signature"),
	})
	use({ "onsails/lspkind-nvim", requires = { "famiu/bufdelete.nvim" } })
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "lukas-reineke/cmp-rg" } },
		},
		config = get_config("cmp"),
	})
	use({
		"L3MON4D3/LuaSnip",
		requires = "saadparwaiz1/cmp_luasnip",
		config = get_config("luasnip"),
	})
	use({ "windwp/nvim-autopairs", config = get_config("autopairs") })
	use({ "folke/which-key.nvim", config = get_config("which") })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = get_config("null-ls"),
	})
	use({ "kyazdani42/nvim-tree.lua", config = get_config("nvim-tree") })
	use({
		"ThePrimeagen/harpoon",
		requires = { "nvim-lua/plenary.nvim" },
		config = get_config("harpoon"),
	})
	use({
		"akinsho/nvim-bufferline.lua",
		requires = "kyazdani42/nvim-web-devicons",
		event = "BufReadPre",
		config = get_config("bufferline"),
	})
end)
