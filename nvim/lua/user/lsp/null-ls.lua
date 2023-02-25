-- Protected call to prevent config crashing
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	vim.notify("Null-ls failed to load!")
	return
end

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.beautysh,
	},
})
