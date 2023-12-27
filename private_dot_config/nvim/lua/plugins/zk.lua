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

		commands.add("ZkDaily", function()
			zk.new({ dir = "daily" })
		end)

		commands.add("ZkTodo", function()
			vim.cmd.edit("$ZK_NOTEBOOK_DIR/TODO.md")
		end)

		commands.add("ZkMeeting", function(note_name)
			zk.new({ dir = "meetings", title = note_name })
		end)

		local wk = require("which-key")
		wk.register({
			z = {
				name = "zk",
				d = { "<cmd>ZkDaily<cr>", "Open daily note" },
				t = { "<cmd>ZkTodo<cr>", "Open todo note" },
				m = {
					function()
						local Input = require("nui.input")
						local event = require("nui.utils.autocmd").event
						local popup_options = {
							position = "50%",
							size = 60,
							border = {
								style = "rounded",
								text = {
									top = "Meeting Name",
									top_align = "center",
								},
							},
							win_options = {
								winhighlight = "Normal:Normal, FloatBorder:Normal",
							},
						}
						local input = Input(popup_options, {
							prompt = "> ",
							default_value = "",
							on_close = function()
								return nil
							end,
							on_submit = function(value)
								if value ~= "" then
									zk.new({ dir = "meetings", title = value })
								end
							end,
						})
						input:mount()
						input:on(event.BufLeave, function()
							input:unmount()
						end)
						input:map("n", "<Esc>", function()
							input:unmount()
						end, { noremap = true })
					end,
					"Create new meeting note",
				},
				{ prefix = "<leader>" },
			},
		})
	end,
}
