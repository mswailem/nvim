local map = vim.api.nvim_set_keymap
map("n", "<SPACE>", "<Nop>", {}) --Unmapping space key to be used as leader
map("n", "<C-u>", "<C-u>zz", {}) --Center the cursor when navigating with C-u and C-d
map("n", "<C-d>", "<C-d>zz", {}) --Center the cursor when navigating with C-u and C-d
map("n", "<leader>pc", '"+p:%s//<cr>', { noremap = true, silent = true, desc = "Paste from system clipboard" })
map("v", "<leader>pc", '"+p:%s//<cr>', { noremap = true, silent = true, desc = "Paste from system clipboard" })
map("n", "<leader>pl", '"0p', { noremap = true, silent = true, desc = "Paste last yanked text" })
map("v", "<leader>pl", '"0p', { noremap = true, silent = true, desc = "Paste last yanked text" })

-- Might not need this, so commenting it out for now
-- map('i','<C-d>', '<Esc>f,lct, ', {})

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sq", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

--Terminal key mappings (might not need this if I will be using tmux)
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, desc = "Exit terminal mode" })
