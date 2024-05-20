return {
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			["<C-v>"] = "actions.select_vsplit",
			["<C-s>"] = "actions.select_split",
			["<C-h>"] = false,
			["<C-l>"] = false,
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
