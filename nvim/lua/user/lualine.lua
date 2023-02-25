-- Protected call to prevent config crashing
local status_ok, lualine= pcall(require, "lualine")
if not status_ok then
  vim.notify("Lualine failed to load!")
  return
end

-- Load lualine
lualine.setup()
