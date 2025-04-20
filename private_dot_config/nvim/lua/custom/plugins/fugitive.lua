return {
	{
		"tpope/vim-fugitive",
		config = function()
			local wk = require("which-key")
			wk.add({
				{ "<leader>g", desc = "git" },
				{ "<leader>gb", ":Gblame<cr>", desc = "blame" },
				{ "<leader>gd", ":Gdiff<cr>", desc = "diff" },
				{ "<leader>gs", ":aboveleft Git<cr>", desc = "status" },
			})
		end,
	},
}
