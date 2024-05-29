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
wk.register({
	["<leader> "] = { ":Telescope find_files<cr>", "Telescope files" },
	["<leader>,"] = { ":Telescope buffers<cr>", "Telescope buffers" },
	["<leader>s"] = {
		name = "+search",
		b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "buffer find" },
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		g = { "<cmd>Telescope live_grep<cr>", "grep" },
		G = { "<cmd>Telescope live_grep_args<cr>", "grep w/ args" },
		h = { "<cmd>Telescope command_history<cr>", "Command History" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		s = { "<cmd>Telescope git_files<cr>", "git files" },
		S = { "<cmd>Telescope spell_suggest<cr>", "Spelling" },
		t = { "<cmd>TodoTelescope<cr>", "Todo" },
		T = { "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", "Todo/Fix/Fixme" },
		w = { "<cmd>Telescope grep_string<cr>", "word under cursor" },
	},
})
