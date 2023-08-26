-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Proteceted call to prevent config crashing
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify("NvimTree failed to load.")
	return
end

local gwidth = vim.api.nvim_list_uis()[1].width
local gheight = vim.api.nvim_list_uis()[1].height
local width = 50
local height = 20

-- Load NvimTree
nvim_tree.setup({
	view = {
		width = 35,
		float = {
			enable = false,
			quit_on_focus_loss = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = width,
				height = height,
				row = (gheight - height) * 0.4,
				col = (gwidth - width) * 0.5,
			},
		},
	},
})
