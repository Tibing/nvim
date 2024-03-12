return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>O", builtin.find_files, { desc = "Find: files" })
      vim.keymap.set("n", "<leader>F", builtin.live_grep, { desc = "Find: in files" })
      vim.keymap.set("v", "<leader>F", builtin.grep_string, { desc = "Find: selection in files" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            layout_strategy = "vertical",
            layout_config = { width = 0.8, height = 0.8, prompt_position = "top", mirror = true },
          },
          live_grep = {
            layout_strategy = "vertical",
            layout_config = { width = 0.8, height = 0.8, prompt_position = "top", mirror = true },
          },
          grep_string = {
            layout_strategy = "vertical",
            layout_config = { width = 0.8, height = 0.8, prompt_position = "top", mirror = true },
          },
        },

        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_cursor({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
