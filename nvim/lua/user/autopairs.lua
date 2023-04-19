-- Protected call to prevent config crashing
local status_ok, autopairs= pcall(require, "nvim-autopairs")
if not status_ok then
    vim.notify("Autopairs failed to load!")
    return
end

-- Load autopairs
autopairs.setup({
    -- map_c_h = true
})
