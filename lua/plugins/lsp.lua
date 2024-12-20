-- test comment
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			-- java
			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})
			lspconfig.angularls.setup({
				capabilities = capabilities,
			})

			-- go to definition
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "GOTO: definition" })
			-- go to implementation
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "GOTO: implementation" })
			-- show usages
			vim.keymap.set("n", "gu", "<cmd>Telescope lsp_references<cr>", { desc = "GOTO: usages", silent = true })
			-- show documentation for function under cursor
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show: docs" })
			-- show code actions selector
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Code: actions" })
			-- rename
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Code: rename" })
		end,
	},
}
