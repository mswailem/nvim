vim.keymap.set('i','{<cr>', '{<cr>}<Esc>0O') --This mapping helps quickly create closing brackets for functions in cpp
vim.keymap.set('n', '<SPACE>', '<Nop>') --Unmapping space key to be used as leader
vim.g.mapleader = ' '
vim.keymap.set('n','<C-u>', '<C-u>zz') --Center the cursor when navigating with C-u and C-d
vim.keymap.set('n','<C-d>', '<C-d>zz') --Center the cursor when navigating with C-u and C-d
vim.keymap.set('n','<leader>p', '"+p') --This mapping helps paste from system clipboard
vim.keymap.set('n','<S-p>', '"0p') --This mapping pastes last yanked text
vim.keymap.set('n','<C-+>', '"+p') --This mapping helps paste from system clipboard while in insert mode
vim.keymap.set('n','<C-0>', '"0p') --This mapping pastes last yanked text while in insert mode
vim.keymap.set('i','<C-d>', '<Esc>f,lct, ') --This mapping helps navigate between aguments of cpp functions while in insert mode
vim.keymap.set('n','<leader>x', ':NERDTreeToggle<cr>', {noremap= true, silent = true})
vim.keymap.set('n', '<leader>f',"<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>1',"<cmd>lua require('fzf-lua').colorschemes()<CR>", { noremap = true, silent = true })
