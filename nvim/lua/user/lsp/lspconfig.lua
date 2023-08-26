local bufopts = { noremap = true, silent = true }

-- Mappings --
-- Diagnostics
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, bufopts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, bufopts)

-- LSP Buffer
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)

-- LSP Workspaces
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)

-- Code manipulation
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)

-- Configuration
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = false,
  update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
      suffix = "",
    },
	signs = {
		active = signs,
	},
})
