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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { silent = true, buffer = args.buf }

    vim.keymap.set(
      "n",
      "gl",
      vim.diagnostic.open_float,
      vim.tbl_extend("force", opts, { desc = "LSP: show diagnostics" })
    )

    vim.keymap.set(
      "n",
      "[d",
      vim.diagnostic.goto_prev,
      vim.tbl_extend("force", opts, { desc = "LSP: previous diagnostic" })
    )

    vim.keymap.set(
      "n",
      "]d",
      vim.diagnostic.goto_next,
      vim.tbl_extend("force", opts, { desc = "LSP: next diagnostic" })
    )
  end,
})
