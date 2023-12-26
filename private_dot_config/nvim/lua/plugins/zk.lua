return {
	"mickael-menu/zk-nvim",
	config = function()
		local zk = require("zk")
		zk.setup({
			-- can be "telescope", "fzf", "fzf_lua" or "select" (`vim.ui.select`)
			-- it's recommended to use "telescope", "fzf" or "fzf_lua"
			picker = "telescope",

			lsp = {
				-- `config` is passed to `vim.lsp.start_client(config)`
				config = {
					cmd = { "zk", "lsp" },
					name = "zk",
					-- on_attach = ...
					-- etc, see `:h vim.lsp.start_client()`
				},

				-- automatically attach buffers in a zk notebook that match the given filetypes
				auto_attach = {
					enabled = true,
					filetypes = { "markdown" },
				},
			},
		})

		local commands = require("zk.commands")
		local function make_edit_fn(defaults, picker_options)
			return function(options)
				options = vim.tbl_extend("force", defaults, options or {})
				zk.edit(options, picker_options)
			end
		end
		commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
	end,
}
