-- Protected call to prevent config crashing
local colorscheme = "catppuccin"

local status_ok, color_set = pcall(require, colorscheme)
if not status_ok then
	vim.notify("Colorscheme not found!")
	return
end

-- Settings
color_set.setup({
	flavour = "macchiato",
	transparent_background = false,
	term_colors = true,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.75,
	},
	integrations = {
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
	},
})

-- Load colorscheme
color_set.load()
