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
					"<C-h>",
					function()
						ui.nav_file(1)
					end,
				},
				{
					"<C-t>",
					function()
						ui.nav_file(2)
					end,
				},
				{
					"<C-n>",
					function()
						ui.nav_file(3)
					end,
				},
				{
					"<C-s>",
					function()
						ui.nav_file(4)
					end,
				},
			}
		end,
	},
}
