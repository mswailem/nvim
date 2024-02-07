local opt = vim.opt
opt.showtabline=2
opt.splitbelow=true
opt.showmode=false
opt.number=true
opt.softtabstop=4
opt.cursorcolumn=true
opt.wildmenu=true
opt.cursorline=true
opt.wildmode="longest:full,full"
opt.tabstop=4
opt.incsearch=true
opt.relativenumber=true
opt.hidden=true
opt.showcmd=true
opt.autoindent=true
opt.autowrite=true
opt.shiftwidth=4
vim.opt.clipboard:append('unnamedplus')
vim.cmd("colorscheme gruvbox")
vim.api.nvim_command(":highlight Normal ctermbg=none")
vim.api.nvim_command(":highlight NonText ctermbg=none")
vim.api.nvim_command(":highlight String ctermbg=none")
vim.api.nvim_command(":highlight LineNr ctermbg=none")

local cal_with_wiki = vim.api.nvim_create_augroup('cal_with_wiki', { clear = true })

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' },{
	pattern = '/tmp/calcurse*',
	group = cal_with_wiki,
	command = 'set filetype=wiki'
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' },{
	pattern = '~/.calcurse/notes/*',
	group = cal_with_wiki,
	command = 'set filetype=wiki'
})

--Setting up folding
vim.wo.foldmethod = 'marker'
vim.wo.foldmarker = '{,}'

--Saving and loading folds
vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*.*",
    callback = function()
        vim.cmd("mkview")
    end
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*.*",
    callback = function()
        vim.cmd("silent! loadview")
    end
})


