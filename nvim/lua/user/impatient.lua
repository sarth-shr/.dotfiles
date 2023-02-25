-- Protected call to prevent config crashing
local status_ok, _ = pcall(require, "impatient")
if not status_ok then
  vim.notify("Impatient failed to load!")
  return
end

