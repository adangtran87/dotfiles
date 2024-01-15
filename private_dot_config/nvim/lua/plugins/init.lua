return {
	{ "akinsho/bufferline.nvim", enabled = false },
	{ "echasnovski/mini.pairs", enabled = false },
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})
		end,
	},
}
