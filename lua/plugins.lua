vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'nvim-tree/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  use 'wbthomason/packer.nvim'
  use 'lambdalisue/nerdfont.vim'

  use 'github/copilot.vim'

  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  --use 'navarasu/onedark.nvim'
  --use "nvim-lua/plenary.nvim"
  --use {
  	  --'nvim-telescope/telescope.nvim', tag = '0.1.1',
  	  -- or                            , branch = '0.1.x',
  	  --requires = { {'nvim-lua/plenary.nvim'} }
  --}
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }
  use 'preservim/nerdtree'
  use {'romgrk/barbar.nvim', requires = 'nvim-tree/nvim-web-devicons'}

  use 'rafi/awesome-vim-colorschemes'
  use "terrortylor/nvim-comment"

  use 'junegunn/fzf'
  use { 'ibhagwan/fzf-lua', requires =  'nvim-tree/nvim-web-devicons' }

  -- Post-install/update hook with neovim command
  use "nvim-treesitter/nvim-treesitter"
  end)

