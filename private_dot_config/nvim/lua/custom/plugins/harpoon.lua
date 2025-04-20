return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	requires = { { "nvim-lua/plenary.nvim", "folke/which-key.nvim" } },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup({})
		-- REQUIRED

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-I>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-O>", function()
			harpoon:list():next()
		end)

		local wk = require("which-key")
		wk.add({
			{ "<leader>h", group = "harpoon" },
			{
				"<leader>ha",
				function()
					harpoon:list():add()
				end,
				desc = "Add file",
			},
			{
				"<leader>he",
				function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Open menu",
			},
			{
				"<leader>hh",
				function()
					harpoon:list():select(1)
				end,
				desc = "Select 1",
			},
			{
				"<leader>hj",
				function()
					harpoon:list():select(2)
				end,
				desc = "Select 2",
			},
			{
				"<leader>hk",
				function()
					harpoon:list():select(3)
				end,
				desc = "Select 3",
			},
			{
				"<leader>hl",
				function()
					harpoon:list():select(4)
				end,
				desc = "Select 4",
			},
		}, { prefix = "<leader>" })
	end,
}
