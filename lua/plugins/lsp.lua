return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				insure_installed = { "lua_ls", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.tsserver.setup({})

			-- go to definition
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "GOTO: definition" })
			-- go to implementation
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "GOTO: implementation" })
			-- show usages
			vim.keymap.set("n", "gu", "<cmd>Telescope lsp_references<cr>", { desc = "GOTO: usages" })
			-- show documentation for function under cursor
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show: docs" })
			-- show code actions selector
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Code: actions" })
		end,
	},
}
