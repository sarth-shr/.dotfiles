---- Protected call to prevent config crashing
local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify("Bufferline failed to load!")
  return
end

-- Load bufferline
bufferline.setup {
  options = {
    separator_style = "slant",
    hover = {
      enabled = true,
      delay   = 200,
      reveal  = { "close" },
    },
    offsets = {
      {
        filetype = "NvimTree",
        text     = "File Explorer",
      }
    }
  }
}
