return {
	"akinsho/bufferline.nvim",
	config = function()
		require("bufferline").setup({
			options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})

		-- Fix bufferline when restoring a session
		vim.api.nvim_create_autocmd("BufAdd", {
			callback = function()
				vim.schedule(function()
					pcall(nvim_bufferline)
				end)
			end,
		})

		vim.keymap.set(
			"n",
			"<leader>bo",
			"<Cmd>BufferLineCloseOthers<CR>",
			{ desc = "Buf: delete others", silent = true }
		)
	end,
}
