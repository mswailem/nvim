return {
	"GCBallesteros/NotebookNavigator.nvim",
	keys = {
		{ "]h", function() require("notebook-navigator").move_cell "d" end },
		{ "[h", function() require("notebook-navigator").move_cell "u" end },
		{ "]h", function() require("notebook-navigator").move_cell "d" end , mode = "v"},
		{ "[h", function() require("notebook-navigator").move_cell "u" end , mode = "v"},

		-- Send cell with vim-slime and don't move
		{ "<leader>R", function() 
			-- Visual mode selection: select a cell or range of text first
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("vih", true, false, true), "x", true)

			-- Send selection with vim-slime
			vim.cmd("SlimeSend")
		end },

		-- Send cell with vim-slime and move to the next cell
		{ "<leader>r", function() 
			-- Visual mode selection: select a cell or range of text first
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("vih", true, false, true), "x", true)

			-- Send selection with vim-slime
			vim.cmd("SlimeSend")
		    require("notebook-navigator").move_cell "d"
		end },
		
		-- TODO: Implement shortcuts for creating cells
	},
	dependencies = { "jpalardy/vim-slime" },
	event = "VeryLazy",
}
