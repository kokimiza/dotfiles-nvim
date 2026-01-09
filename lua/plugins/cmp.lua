return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "v1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 1. キーマップ: デフォルトが使いにくい場合はここを調整
			-- 公式推奨の 'default' は C-y で確定、'super-tab' は Tab で確定
			keymap = { preset = "super-tab" },

			-- 2. 外観: モダンなアイコンと視認性の向上
			appearance = {
				nerd_font_variant = "mono",
			},

			-- 3. 補完動作
			completion = {
				-- 入力中にドキュメントを自動表示（IDEのような体験）
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				-- 補完ウィンドウに枠線を付ける
				menu = { border = "rounded" },
				-- 補完候補の確定前に「ゴーストテキスト」を表示
				ghost_text = { enabled = true },
			},
			-- 4. 関数の引数ガイド
			signature = {
				enabled = true,
				window = { border = "rounded" },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		-- 拡張性を確保するための設定
		opts_extend = { "sources.default" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			-- blink.cmp から capabilities を取得
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- 1. Lua (lua_ls) の設定
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				-- 必要なら settings 等をここに書く
			})

			-- 2. Haskell (hls) の設定
			-- GHC 2024 / GHC 9.14 の性能をフルに引き出す最新の記法
			vim.lsp.config("hls", {
				capabilities = capabilities,
				settings = {
					haskell = {
						formattingProvider = "ormolu",
						checkProject = true,
					},
				},
			})

			-- 設定したサーバーを起動（enable）
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("hls")
		end,
	},
}
