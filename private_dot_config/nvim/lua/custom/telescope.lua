local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<esc>"] = actions.close,
				["<c-u>"] = false,
				["<c-d>"] = false,
				["<a-up>"] = actions.preview_scrolling_up,
				["<a-down>"] = actions.preview_scrolling_down,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
		buffers = {
			mappings = {
				i = {
					["<c-d>"] = actions.delete_buffer + actions.move_to_top,
				},
			},
		},
		find_files = {
			hidden = true,
			find_command = {
				"rg",
				"--files",
				"--color",
				"never",
				-- "--ignore-file",
				-- vim.env.XDG_CONFIG_HOME .. "/ripgrep/ignore",
			},
		},
		live_grep = {
			path_display = { "shorten" },
		},
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})

-- keybinds
local wk = require("which-key")
local builtin = require("telescope.builtin")
wk.add({
	{ "<leader> ", ":Telescope find_files<cr>", desc = "Telescope files" },
	{ "<leader>,", ":Telescope buffers<cr>", desc = "Telescope buffers" },
	{ "<leader>s", group = "search" },
	{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "buffer find" },
	{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
	{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "grep" },
	{ "<leader>sG", "<cmd>Telescope live_grep_args<cr>", desc = "grep w/ args" },
	{ "<leader>sh", "<cmd>Telescope command_history<cr>", desc = "Command History" },
	{ "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Registers" },
	{ "<leader>ss", "<cmd>Telescope git_files<cr>", desc = "git files" },
	{ "<leader>sS", "<cmd>Telescope spell_suggest<cr>", desc = "Spelling" },
	{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
	{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
	{ "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "word under cursor" },
	{ "<leader>v", group = "vim" },
	{ "<leader>vh", builtin.help_tags, desc = "vim help tags" },
})
