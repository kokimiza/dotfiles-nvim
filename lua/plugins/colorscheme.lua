return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha"
    })
    vim.cmd.colorscheme("catppuccin")
  end,

  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Haskell などの必要なパーサーを自動インストール
      ensure_installed = { "haskell", "lua", "vim", "vimdoc", "bash" },
      -- ハイライトを有効にする
      highlight = {
        enable = true,
        -- 標準のシンタックスハイライトを無効化して Tree-sitter に一本化
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}

