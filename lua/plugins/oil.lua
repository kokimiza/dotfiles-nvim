return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		cmd = { "Oil" },
		keys = {
			{ "-", "<cmd>Oil<CR>", desc = "Open parent directory" },
		},
		opts = {
			default_file_explorer = true,
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			view_options = {
				show_hidden = true,
			},
		},
	},
}
