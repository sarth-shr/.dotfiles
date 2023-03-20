-- Protected call to prevent config crashing
local status_ok, Comment= pcall(require, "Comment")
if not status_ok then
  vim.notify("Comment failed to load!")
  return
end

Comment.setup()
