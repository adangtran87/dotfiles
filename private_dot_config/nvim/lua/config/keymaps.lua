-- Fast write
vim.keymap.set("n", "<leader>W", ":w<cr>", { desc = "Fast write" })

-- nvim-tmux
vim.keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { silent = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Quickfix nav
-- vim.keymap.set("n", "<C-L>", "<cmd>cnext<cr>", { silent = true })
-- vim.keymap.set("n", "<C-K>", "<cmd>cprev<cr>", { silent = true })

local wk = require("which-key")
wk.add({
	{ "<leader>-", ":Oil<cr>", desc = "Oil" },
	{ "<leader>W", ":w<cr>", desc = "Fast write" },
	{ "<leader>L", ":Lazy<cr>", desc = "lazy", noremap = true },
	{ "<leader>w", group = "window" },
	{ "<leader>=", "<C-w>=", desc = "Equal Size Splits" },
	{ "<leader>wm", "<cmd>MaximizerToggle<cr>", desc = "Maximize Split" },
	{ "<leader>wo", "<C-w>o", desc = "Cl[o]se splits" },
	{ "<leader>ws", "<cmd>split<cr>", desc = "Split Horizontal" },
	{ "<leader>wv", "<cmd>vsplit<cr>", desc = "Split Vertical" },
	{ "<leader>d", group = "desc" },
	{ "<leader>dg", "<cmd>descget<cr>", desc = "[d]iff [g]et" },
	{ "<leader>do", "<cmd>windo descoff<cr>", desc = "[d]iff [o]ff" },
	{ "<leader>dp", "<cmd>descput<cr>", desc = "[d]iff [p]ut" },
	{ "<leader>dd", "<cmd>windo descthis<cr>", desc = "[d]iff splits" },
})
