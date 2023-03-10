-- Protected call to prevent config crashing
local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  vim.notify("Indent Blankline failed to load!")
end

-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

indent_blankline.setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
