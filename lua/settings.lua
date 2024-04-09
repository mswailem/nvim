local opt = vim.opt

opt.showtabline = 2
opt.splitbelow = true
opt.showmode = false
opt.number = true
opt.softtabstop = 4
opt.cursorcolumn = true
opt.wildmenu = true
opt.cursorline = true
opt.wildmode = "longest:full,full"
opt.tabstop = 4
opt.incsearch = true
opt.relativenumber = true
opt.hidden = true
opt.showcmd = true
opt.autoindent = true
opt.autowrite = true
opt.shiftwidth = 4
vim.opt.clipboard:append("unnamedplus")
vim.cmd("colorscheme OceanicNext")
opt.termguicolors = true

--For transparency
--vim.api.nvim_command(":highlight Normal ctermbg=none")
--vim.api.nvim_command(":highlight NonText ctermbg=none")
--vim.api.nvim_command(":highlight String ctermbg=none")
--vim.api.nvim_command(":highlight LineNr ctermbg=none")
vim.lsp.set_log_level("debug")
