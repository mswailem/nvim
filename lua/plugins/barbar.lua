return {
	'romgrk/barbar.nvim',
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()

		local map = vim.api.nvim_set_keymap

		map('n', '<TAB>', '<Cmd>BufferNext<CR>', {noremap = true, desc = "Next buffer"})
		map('n', '<leader>tma', '<Cmd>BufferMovePrevious<CR>', {noremap = true, desc = "Move buffer to previous position"})
		map('n', '<S-TAB>', '<Cmd>BufferPrevious<CR>', {noremap = true, desc = "Previous buffer"})
		map('n', '<leader>tmd', '<Cmd>BufferMoveNext<CR>', {noremap = true, desc = "Move buffer to next position"})
		map('n', '<leader>q', '<Cmd>bd<CR>', {noremap = true, desc = "Close buffer"})
	end
}
