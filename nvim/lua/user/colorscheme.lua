-- Protected call to prevent config crashing
local colorscheme = "kanagawa"

local status_ok, color_set = pcall(require, colorscheme)
if not status_ok then
	vim.notify("Colorscheme not found!")
	return
end

-- Set colorscheme
color_set.setup({
	dimInactive = true,
	transparent = false,
})

color_set.load()
