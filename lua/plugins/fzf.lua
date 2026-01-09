return {
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		keys = {
			{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find files" },
			{ "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
			{ "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
		},
		opts = {
			winopts = {
				height = 0.85,
				width = 0.85,
				preview = {
					layout = "vertical",
				},
			},
		},
	},
}
