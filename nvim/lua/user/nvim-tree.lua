-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Proteceted call to prevent config crashing
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	vim.notify("NvimTree failed to load.")
	return
end

-- Load NvimTree
nvim_tree.setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
})
