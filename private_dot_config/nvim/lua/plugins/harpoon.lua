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
		vim.keymap.set("n", "<C-i>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-o>", function()
			harpoon:list():next()
		end)

		local wk = require("which-key")
		wk.register({
			h = {
				name = "harpoon",
				a = {
					function()
						harpoon:list():append()
					end,
					"Add file",
				},
				e = {
					function()
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					"Open menu",
				},
				h = {
					function()
						harpoon:list():select(1)
					end,
					"Select 1",
				},
				j = {
					function()
						harpoon:list():select(2)
					end,
					"Select 2",
				},
				k = {
					function()
						harpoon:list():select(3)
					end,
					"Select 3",
				},
				l = {
					function()
						harpoon:list():select(4)
					end,
					"Select 4",
				},
			},
		}, { prefix = "<leader>" })
	end,
}
