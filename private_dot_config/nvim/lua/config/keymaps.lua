-- Fast write
vim.keymap.set("n", "<leader>W", ":w<cr>", { desc = "Fast write" })

-- More intuitive splits
vim.keymap.set("n", "<leader>ws", "<cmd>split<cr>", { desc = "horizontal split" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "vertical split" })

-- nvim-tmux
vim.keymap.set("n", "<C-h>", ":NvimTmuxNavigateLeft<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", ":NvimTmuxNavigateDown<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", ":NvimTmuxNavigateUp<cr>", { silent = true })
vim.keymap.set("n", "<C-l>", ":NvimTmuxNavigateRight<cr>", { silent = true })
