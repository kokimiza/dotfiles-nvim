return {
	-- 1. 補完エンジン: blink.cmp
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "v1.*",
		opts = {
			keymap = { preset = "super-tab" },
			appearance = { nerd_font_variant = "mono" },
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 200 },
				menu = { border = "rounded" },
				ghost_text = { enabled = true },
			},
			signature = { enabled = true, window = { border = "rounded" } },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
	},

	-- 2. LSP設定
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local servers = {
				lua_ls = {},

				hls = {
					settings = {
						haskell = {
							formattingProvider = "ormolu",
							checkProject = true,
						},
					},
				},

				-- Typst / Tinymist
				tinymist = {
					settings = {
						formatterMode = "typstyle",
						exportPdf = "onType",
						semanticTokens = "disable",
					},
				},

				rust_analyzer = {},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
