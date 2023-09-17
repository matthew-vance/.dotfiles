return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.pairs").setup()
			require("mini.comment").setup()
			require("mini.indentscope").setup()
			require("mini.cursorword").setup()
			require("mini.trailspace").setup()
			require("mini.starter").setup()
			require("mini.animate").setup({
				scroll = {
					enable = false,
				},
			})

			local clue = require("mini.clue")
			clue.setup({
				triggers = {
					{ mode = "n", keys = "<Leader>" },
					{ mode = "x", keys = "<Leader>" },
					{ mode = "i", keys = "<C-x>" },
					{ mode = "n", keys = "g" },
					{ mode = "x", keys = "g" },
					{ mode = "n", keys = "'" },
					{ mode = "n", keys = "`" },
					{ mode = "x", keys = "'" },
					{ mode = "x", keys = "`" },
					{ mode = "n", keys = '"' },
					{ mode = "x", keys = '"' },
					{ mode = "i", keys = "<C-r>" },
					{ mode = "c", keys = "<C-r>" },
					{ mode = "n", keys = "<C-w>" },
					{ mode = "n", keys = "z" },
					{ mode = "x", keys = "z" },
				},
				clues = {
					clue.gen_clues.builtin_completion(),
					clue.gen_clues.g(),
					clue.gen_clues.marks(),
					clue.gen_clues.registers(),
					clue.gen_clues.windows(),
					clue.gen_clues.z(),
					{ mode = "n", keys = "<Leader>f", desc = "+Fuzzy Find" },
					{ mode = "n", keys = "<Leader>h", desc = "+Harpoon" },
					{ mode = "n", keys = "<Leader>x", desc = "+Trouble" },
				},
			})

			require("mini.files").setup({
				windows = {
					preview = true,
					width_focus = 30,
					width_preview = 30,
				},
			})
			require("mini.surround").setup({
				mappings = {
					add = "gsa",
					delete = "gsd",
					find = "gsf",
					find_left = "gsF",
					highlight = "gsh",
					replace = "gsr",
					update_n_lines = "gsn",
				},
			})
		end,
	},
}
