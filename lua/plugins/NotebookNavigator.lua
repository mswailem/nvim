return {
	"GCBallesteros/NotebookNavigator.nvim",
	keys = {
		{ "]h", function() require("notebook-navigator").move_cell "d" end },
		{ "[h", function() require("notebook-navigator").move_cell "u" end },
		{ "]h", function() require("notebook-navigator").move_cell "d" end , mode = "v"},
		{ "[h", function() require("notebook-navigator").move_cell "u" end , mode = "v"},
		
		-- Create cells
		{ "<leader>h", function() require("notebook-navigator").add_cell_below() end },
		{ "<leader>H", function() require("notebook-navigator").add_cell_above() end },
	},
	opts = { cell_markers = {
			python = "# %%",
			cpp = "// %%",
	}},
	dependencies = { "jpalardy/vim-slime" },
	event = "VeryLazy",
}
