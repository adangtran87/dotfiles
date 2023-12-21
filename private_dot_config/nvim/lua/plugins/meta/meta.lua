return {
	dir = "~/.config/fb-editor-support/nvim",
	priority = 10,
	name = "meta.nvim",
	config = function()
		local meta_lsp = require("meta.lsp")
		local servers = { "rust-analyzer@meta", "pyls@meta", "pyre@meta", "thriftlsp@meta", "cppls@meta" }
		for _, lsp in ipairs(servers) do
			require("lspconfig")[lsp].setup({
				on_attach = meta_lsp.on_attach,
			})
		end

		require("meta.metamate").init()
		require("meta.hg").setup()
		require("meta.cmds")
		require("plenary.filetype").add_file("meta")
		require("telescope").load_extension("myles")
	end,
}
