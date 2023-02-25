-- Protected call to prevent config crashing
local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	vim.notify("Treesitter failed to load!")
	return
end

configs.setup({
	ensure_installed = { "c", "lua", "vim", "help", "python", "html", "css", "javascript", "java" },
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},

	rainbow = {
		enable = true,
		extended_mode = true,
	},
})
