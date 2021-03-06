return {
	-- add gruvbox
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			italic = {
				strings = false,
				emphasis = true,
				comments = false,
				operators = false,
				folds = true,
			},
			contrast = "soft",
		})
		-- load the colorscheme here
		vim.cmd("colorscheme catppuccin")
	end,
}
