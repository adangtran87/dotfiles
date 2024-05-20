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
					s = { ":Git<cr>", "status" },
				},
			})
		end,
	},
}
