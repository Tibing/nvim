return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gs = require("gitsigns")
      gs.setup({})

      vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "Git: preview hunk" })
    end,
  },
}
