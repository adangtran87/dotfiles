-- Fast write
vim.keymap.set("n", "<leader>W", ":w<cr>", { desc = "Fast write" })

-- nvim-tmux
vim.keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { silent = true })

local wk = require("which-key")
wk.register({
	["<leader>-"] = { ":Oil<cr>", "Oil" },
	["<leader>W"] = { ":w<cr>", "Fast write" },
	["<leader>L"] = { ":Lazy<cr>", "lazy", noremap = true },
	["<leader>w"] = {
		name = "+window",
		s = { "<cmd>split<cr>", "Split Horizontal" },
		v = { "<cmd>vsplit<cr>", "Split Vertical" },
		["="] = { "<C-w>=", "Equal Size Splits" },
		m = { "<cmd>MaximizerToggle<cr>", "Maximize Split" },
	},
})
