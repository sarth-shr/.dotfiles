local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Protected call to prevent config crashing
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Packer failed to load!")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Base plugins
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins

	-- Colorschemes & theming
	use("catppuccin/nvim")
	use("rebelot/kanagawa.nvim")
	use("Mofiqul/dracula.nvim")
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim")
	use("NvChad/nvim-colorizer.lua")
	use("nvim-tree/nvim-web-devicons")

	-- File explorer
	use("nvim-tree/nvim-tree.lua")

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lua")

	-- Snippet engine
	use("L3MON4D3/LuaSnip")

	-- Snippet sources
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	-- Treesitter & highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("folke/trouble.nvim")
	use("numToStr/Comment.nvim")
	use("mrjones2014/nvim-ts-rainbow")
	use("lukas-reineke/indent-blankline.nvim")
	use("windwp/nvim-autopairs")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
	})

	-- Gitsigns for git integration
	use("lewis6991/gitsigns.nvim")

	-- Terminal Integration
	use("akinsho/toggleterm.nvim")

	-- Impatient (improve startup time)
	use("lewis6991/impatient.nvim")

	-- Discord Rich Presence
	use("andweeb/presence.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
