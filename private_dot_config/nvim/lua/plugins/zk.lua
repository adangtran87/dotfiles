-- Customize the popup
--
---@param name string top name
local function popup_custom(name)
	return {
		position = "50%",
		size = 60,
		border = {
			style = "rounded",
			text = {
				top = name,
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal, FloatBorder:Normal",
		},
	}
end

-- Customize popup
--
---@param submit_fn function submit function
---@param popup table Popup options
local function zk_popup(submit_fn, popup)
	local Input = require("nui.input")
	local event = require("nui.utils.autocmd").event
	local zk = require("zk")
	local input = Input(popup, {
		prompt = "> ",
		default_value = "",
		on_close = function()
			return nil
		end,
		on_submit = function(value)
			if value ~= "" then
				submit_fn(value)
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
	input:map("i", "<Esc>", function()
		input:unmount()
	end, { noremap = true })
end

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
				f = {
					function()
						zk_popup(function(value)
							require("zk.commands").get("ZkNotes")({ sort = { "modified" }, match = { value } })
						end, popup_custom("Search"))
					end,
					"Find notes",
				},
				m = {
					function()
						zk_popup(function(value)
							zk.new({ dir = "meetings", title = value })
						end, popup_custom("Meeting Name"))
					end,
					"Create new meeting note",
				},
				n = {
					function()
						zk_popup(function(value)
							zk.new({ dir = "", title = value })
						end, popup_custom("Title"))
					end,
					"Create new note",
				},
				o = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Open note picker" },
				t = { "<cmd>ZkTags<cr>", "Note picker by tag" },
				["<space>"] = { "<cmd>ZkTodo<cr>", "Open todo note" },
			},
		}, { prefix = "<leader>", noremap = true, silent = false })
	end,
}
