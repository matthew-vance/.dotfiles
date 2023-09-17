return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		jump = {
			autojump = true,
		},
	},
	keys = function()
		local flash = require("flash")
		return {
			{
				"<leader>j",
				mode = { "n", "o", "x" },
				function()
					flash.jump()
				end,
				desc = "Jump",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					flash.toggle()
				end,
				desc = "Toggle Flash Search",
			},
		}
	end,
}
