return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- 保存時に自動実行
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			haskell = { "ormolu" },
			rust = { "rustfmt" },
			python = { "ruff_organize_imports", "ruff_format" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback", -- LSPがフォーマットを持っていない場合にStyLuaを使う
		},
	},
}
