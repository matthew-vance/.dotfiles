return {
	{
		"ThePrimeagen/harpoon",
		dependencies = { "plenary.nvim" },
		keys = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			return {
				{ "<leader>h", mark.add_file, { desc = "Harpoon file" } },
				{ "<C-e>", ui.toggle_quick_menu },
				{
					"<leader>1",
					function()
						ui.nav_file(1)
					end,
				},
				{
					"<leader>2",
					function()
						ui.nav_file(2)
					end,
				},
				{
					"<leader>3",
					function()
						ui.nav_file(3)
					end,
				},
				{
					"<leader>4",
					function()
						ui.nav_file(4)
					end,
				},
				{
					"<leader>[",
					function()
						ui.nav_prev()
					end,
				},
				{
					"<leader>]",
					function()
						ui.nav_next()
					end,
				},
			}
		end,
	},
}
