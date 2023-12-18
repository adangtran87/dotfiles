return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		ensure_installed = {
			"stylua",
			"shfmt",
			"flake8",
		},
	},
	automatic_installation = true,
}
