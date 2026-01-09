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

				haskell = {
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

				-- Python: 型解析 (basedpyright) と リンター (ruff)
				basedpyright = {
					settings = {
						basedpyright = {
							analysis = {
								typeCheckingMode = "basic", -- 必要に応じて "strict" に変更
								autoImportCompletions = true,
							},
						},
					},
				},

				ruff = {
					-- ruff のホバー表示は pyright と重複するため無効化
					on_attach = function(client)
						client.server_capabilities.hoverProvider = false
					end,
				},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
