return {
	--icons and fonts
	"ryanoasis/vim-devicons",
	"lambdalisue/nerdfont.vim",

	-- my plugins
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	},
	"rafi/awesome-vim-colorschemes",
	"junegunn/fzf",
	{ "ibhagwan/fzf-lua", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "echasnovski/mini.nvim", version = false },
	-- {
	-- 	"GCBallesteros/jupytext.nvim",
	-- 	config = true,
	-- },
	"christoomey/vim-tmux-navigator",
	"voldikss/vim-mma",
	"jpalardy/vim-slime",
	{
		"GCBallesteros/jupytext.nvim",
		config = true,
	}
}
