vim.opt.iskeyword:append("-") -- ignore hyphens
vim.opt.clipboard = "unnamedplus" -- system clipboard
vim.opt.mouse = "a" -- enable mouse

vim.opt.mousemoveevent = true

vim.opt.pumheight = 10 -- pop up menu height
vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.opt.showtabline = 2 -- always show tabs
vim.opt.scrolloff = 8 -- verticcal scroll offset
vim.opt.sidescrolloff = 8 -- horizontal scroll offset

vim.opt.wrap = false -- disable line wrap
vim.opt.showmode = false --  disable info about which mode nvim is in
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative number
vim.opt.hlsearch = false -- highlight all instances of a searched pattern
vim.opt.smartcase = true -- override ignorecase if search pattern includes upper case characters
vim.opt.incsearch = true -- show partial matches
vim.opt.ignorecase = true -- case insensitive search
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.autoindent = true -- enable auto indenting
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.cursorline = true -- highlight the current line
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
