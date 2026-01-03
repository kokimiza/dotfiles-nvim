-- insert mode: jj -> normal
vim.keymap.set("i", "jj", "<Esc>", {
  noremap = true,
  silent = true,
})

-- visual mode: jj -> normal
vim.keymap.set("v", "jj", "<Esc>", {
  noremap = true,
  silent = true,
})

-- terminal mode: jj -> normal
vim.keymap.set("t", "jj", [[<C-\><C-n>]], {
  noremap = true,
  silent = true,
})

vim.keymap.set("n", "<leader>l", ":tabnext<CR>")
vim.keymap.set("n", "<leader>h", ":tabprevious<CR>")

vim.opt.timeout = true
vim.opt.timeoutlen = 300

