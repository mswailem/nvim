local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<S-TAB>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<TAB>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<leader>a', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<leader>d', '<Cmd>BufferMoveNext<CR>', opts)
-- Close current buffer remap
map('n', '<leader>q', '<Cmd>BufferClose<CR>', opts)
