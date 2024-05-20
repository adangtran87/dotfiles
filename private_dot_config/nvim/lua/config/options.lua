local opt = vim.opt

-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.colorcolumn = { 80, 120 }
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.ignorecase = true -- Ignore case
opt.laststatus = 3 -- global statusline
opt.list = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.showmode = false
opt.signcolumn = "yes"
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true
opt.softtabstop = 2
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true

opt.undofile = true
opt.undolevels = 10000
opt.wrap = false

vim.g.autoformat = true
vim.g.markdown_recommended_style = 0
