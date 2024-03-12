-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "GOTO: left window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "GOTO: lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "GOTO: upper window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "GOTO: right window", remap = true })

-- windows
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Win: delte", remap = true })
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Win: split below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Win: split right", remap = true })

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buf: prev" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Buf: next" })

vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<cr>", { desc = "Search: clear" })
