return {
  "smjonas/inc-rename.nvim",
  config = function()
	vim.keymap.set("n", "<leader>rn", ":IncRename ", {desc = "Incremental rename"})
  end,
}
