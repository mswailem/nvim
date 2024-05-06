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
-- vim.api.nvim_set_hl(0, "Normal", {bg = "NONE"})
-- vim.api.nvim_set_hl(0, "NonText", {bg = "NONE"})
-- vim.api.nvim_set_hl(0, "String", {bg = "NONE"})
-- vim.api.nvim_set_hl(0, "LineNr", {bg = "NONE"})
-- vim.api.nvim_set_hl(0, "EndOfBuffer", {bg = "NONE"})
-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "NONE"})
-- vim.api.nvim_set_hl(0, "FloatBorder", {bg = "NONE"})
-- vim.api.nvim_set_hl(0, "IblScope", {fg = "NONE", bg = "NONE", italic = true})

-- For slime
vim.g.slime_target = "tmux"
-- Set default tmux configuration with pane 1 selected
vim.g.slime_default_config = {socket_name = "default", target_pane = "1"}
vim.g.slime_dont_ask_default = 1
vim.g.slime_bracketed_paste = 1
vim.g.slime_no_mappings = 1
vim.g.slime_cell_delimiter = ""

-- Set cell delimiter for Python and IPython files
vim.api.nvim_exec([[
augroup filetypes
  autocmd!
  autocmd FileType python,ipython let b:slime_cell_delimiter = "# %%"
augroup END
]], false)

-- Set cell delimiter for C and C++ files
vim.api.nvim_exec([[
augroup filetypes
  autocmd!
  autocmd FileType cpp,c let b:slime_cell_delimiter = "// %%"
augroup END
]], false)

