return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"simrat39/rust-tools.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	opts = {
		servers = {
			clangd = {},
			cssls = {},
			lua_ls = {},
			pyright = {},
			rust_analyzer = {},
		},
	},
}
