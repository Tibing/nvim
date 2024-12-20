return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
        },
      },
      -- remove icons for neotree
      renderers = {
        directory = {
          { "indent" },
          { "name" },
        },
        file = {
          { "indent" },
          { "name" },
        },
      },
    })

    vim.keymap.set("n", "<leader>n", ":Neotree filesystem toggle<CR>", { desc = "NT: toggle", silent = true })

    -- reveals a file in the tree
    -- vim.keymap.set("n", "<leader>nr", ":Neotree reveal<CR>", { desc = "NT: reveal", silent = true })
  end,
}
