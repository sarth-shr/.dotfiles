-- Protected call to prevent config crashing
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	vim.notify("Telescope failed to load!")
	return
end

local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

-- Mappings --
-- Builtin
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- Configuration
telescope.setup {
  defaults = {
    prompt_prefix = "󰭎  ",
    selection_caret = " ",

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
}
