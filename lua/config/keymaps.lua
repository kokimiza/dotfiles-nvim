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

-- タブ移動
vim.keymap.set("n", "<leader>l", ":tabnext<CR>")
vim.keymap.set("n", "<leader>h", ":tabprevious<CR>")

-- ウィンドウ分割
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "垂直分割 (Split Vertical)" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "水平分割 (Split Horizontal)" })
vim.keymap.set("n", "<leader>sc", ":close<CR>", { desc = "ウィンドウを閉じる (Split Close)" })

-- ウィンドウ間移動
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "左のウィンドウに移動" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "下のウィンドウに移動" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "上のウィンドウに移動" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "右のウィンドウに移動" })

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
