-- Protected call to prevent config crashing
local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	vim.notify("Indent Blankline failed to load!")
end

ibl.setup({})
