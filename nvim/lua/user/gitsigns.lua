-- Protected call to prevent config crashing
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  vim.notify("Gitsigns failed to load!")
  return
end

gitsigns.setup()
