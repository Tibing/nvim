return {
	{
		"kdheepak/lazygit.nvim",
		config = function()
			vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Git: lazygit", silent = true })
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gs = require("gitsigns")
			gs.setup({})

			vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "Git: preview hunk" })
			vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { desc = "Git: reset hunk" })
		end,
	},
}
