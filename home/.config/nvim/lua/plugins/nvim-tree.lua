return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-web-devicons",
	},
	keys = {
		{ "<leader>et", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
		{ "<leader>ef", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in current buffer" },
		{ "<leader>ec", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse the file tree" },
	},
	opts = {
		filters = {
			git_ignored = false,
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
}
