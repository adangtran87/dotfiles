local opt = vim.opt

-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.colorcolumn = { 80, 120 }
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.ignorecase = true -- Ignore case
-- Preview substitutions live, as you type!
opt.inccommand = 'split'
opt.laststatus = 3 -- global statusline
opt.list = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10
opt.shiftwidth = 2
opt.showmode = false
opt.signcolumn = "yes"
-- Preview substitutions live, as you type!
opt.inccommand = 'split'
opt.softtabstop = 2
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 300

opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 250
opt.wrap = false

vim.g.autoformat = true
vim.g.markdown_recommended_style = 0
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

