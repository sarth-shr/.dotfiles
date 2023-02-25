-- Protected call to prevent config crashing
local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	vim.notify("Trouble failed to load!")
	return
end

local opts = { noremap = true, silent = true }

-- Mappings 
vim.keymap.set("n", "<leader>xw", ":TroubleToggle<CR>", opts)
vim.keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>", opts)
vim.keymap.set("n", "gr", ":TroubleToggle lsp_references<CR>", opts)

trouble.setup()
