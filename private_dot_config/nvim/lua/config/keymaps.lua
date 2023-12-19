-- Fast write
vim.keymap.set("n", "<leader>W", ":w<cr>", { desc = "Fast write" })

-- More intuitive splits
vim.keymap.set("n", "<leader>ws", "<cmd>split<cr>", { desc = "horizontal split" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "vertical split" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "equal size splits" })
vim.keymap.set("n", "<leader>wm", "<cmd>MaximizerToggle<cr>", { desc = "maximize split" })

-- nvim-tmux
vim.keymap.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { silent = true })
