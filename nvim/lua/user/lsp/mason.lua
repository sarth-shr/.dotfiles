-- Protected call to prevent config crashing
local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	vim.notify("Mason failed to load!")
	return
end

-- Protected call to prevent config crashing
local mason_lsp_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_status_ok then
	vim.notify("Mason-LSPConfig failed to load!")
	return
end

-- Protected call to prevent config crashing
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	vim.notify("LSPConfig failed to load!")
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = { "lua_ls", "pyright" },
	automatic_installation = true,
})

mason_lspconfig.setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({})
	end,
	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
})
