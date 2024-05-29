return {
	{
		"tpope/vim-fugitive",
		config = function()
			local wk = require("which-key")
			wk.register({
				["<leader>g"] = {
					name = "+git",
					b = { ":Gblame<cr>", "blame" },
					d = { ":Gdiff<cr>", "diff" },
					s = { ":aboveleft Git<cr>", "status" },
				},
			})
		end,
	},
}
