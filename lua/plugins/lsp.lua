return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local map = vim.keymap.set -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Show LSP definitions"
				map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP document symbols"
				map("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				opts.noremap = true
				map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "Telescope treesitter"
				map("n", "gT", "<cmd>Telescope treesitter<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Show buffer diagnostics"
				map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				map("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				map("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				map("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				map("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- disable diagnostics for C++ notebook files (disables diagnostics if file starts with // %%)
		vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
			local bufnr = ctx.bufnr or vim.api.nvim_get_current_buf()

			if not bufnr or bufnr < 1 then
				return
			end

			-- Check if the first line of the file contains '// %%'
			local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)
			if #first_line > 0 and first_line[1]:match("^// %%") then
				result.diagnostics = {}
			else
				vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
			end
		end

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Helper function to find the CMakeLists.txt directory
		local function find_project_root()
			local cwd = vim.fn.getcwd()
			local root_marker = 'CMakeLists.txt'
			local project_root = vim.fn.findfile(root_marker, cwd .. ';')
			if project_root == '' then
				return nil
			else
				return vim.fn.fnamemodify(project_root, ':h')
			end
		end

		-- Configure clangd
		lspconfig.clangd.setup({
			capabilities = capabilities,
			on_new_config = function(new_config, new_root_dir)
				local project_root = find_project_root()
				if project_root then
					new_config.cmd = {
						"clangd",
						"--compile-commands-dir=" .. project_root .. "/build"
					}
					new_config.root_dir = project_root
				end
			end,
			-- Optional: specify other clangd settings here
			settings = {
				clangd = {
					-- Add other clangd-specific settings here
				}
			}
		})

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
		})
	end,
}

