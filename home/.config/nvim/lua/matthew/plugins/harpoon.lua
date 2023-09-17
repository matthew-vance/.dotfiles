return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		return {
			{ "<leader>ha", mark.add_file, desc = "Harpoon file" },
			{ "<leader>hm", ui.toggle_quick_menu, desc = "Toggle Harpoon quick menu" },
			{
				"<leader>1",
				function()
					ui.nav_file(1)
				end,
				desc = "Open first harpooned file",
			},
			{
				"<leader>2",
				function()
					ui.nav_file(2)
				end,
				desc = "Open second harpooned file",
			},
			{
				"<leader>3",
				function()
					ui.nav_file(3)
				end,
				desc = "Open third harpooned file",
			},
			{
				"<leader>4",
				function()
					ui.nav_file(4)
				end,
				desc = "Open fourth harpooned file",
			},
			{
				"<leader>[",
				function()
					ui.nav_prev()
				end,
				desc = "Open previous harpooned file",
			},
			{
				"<leader>]",
				function()
					ui.nav_next()
				end,
				desc = "Open next harpooned file",
			},
		}
	end,
}
