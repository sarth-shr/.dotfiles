-- Protected call to prevent config crashing
local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	vim.notify("Colorizer failed to load!")
	return
end

-- Load colorizer
colorizer.setup()
