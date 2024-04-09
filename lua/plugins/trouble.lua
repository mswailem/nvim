return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    { "<leader>dd", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list", noremap = true },
    { "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics", noremap = true },
    { "<leader>df", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics", noremap = true },
    { "<leader>dq", "<cmd>TroubleToggle quickfix<CR>", desc = "Open trouble quickfix list", noremap = true },
    { "<leader>dl", "<cmd>TroubleToggle loclist<CR>", desc = "Open trouble location list", noremap = true },
    { "<leader>dt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble", noremap = true },
  },
}
