-- WARNING: after doing changes in this file don't forget to run :Mason and install required formatter or diagnostics tools
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		null_ls.setup({

			-- handle auto formatting on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,

			sources = {
				-- lua formatter
				null_ls.builtins.formatting.stylua, -- prettier daemon
				null_ls.builtins.formatting.prettierd, -- editorconfig checker
				null_ls.builtins.diagnostics.editorconfig_checker,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
