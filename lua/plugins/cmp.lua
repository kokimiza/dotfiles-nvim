return {
  -- 1. 補完エンジン: blink.cmp
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = 'v1.*',
    opts = {
      keymap = { preset = 'super-tab' },
      appearance = { nerd_font_variant = 'mono' },
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        menu = { border = 'rounded' },
        ghost_text = { enabled = true },
      },
      signature = { enabled = true, window = { border = 'rounded' } },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { 'sources.default' },
  },

  -- 2. LSP設定
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        lua_ls = {},

        hls = {
          settings = {
            haskell = {
              formattingProvider = 'ormolu',
              checkProject = true,
            },
          },
        },

        -- Typst / Tinymist
        tinymist = {
          settings = {
            formatterMode = 'typstyle',
            exportPdf = 'onType',
            semanticTokens = 'disable',
          },
        },

        rust_analyzer = {},
        -- servers テーブル内に追加
        ruff = {
          -- RuffをLSPとして使うと、保存時に未使用インポートの削除などが自動で行えます
          on_attach = function(client, bufnr)
            -- Ruffのホバー（定義表示）はPyrightと重複するので無効化するのが一般的
            client.server_capabilities.hoverProvider = false
          end,
        },
        basedpyright = {
          -- 型チェックは basedpyright、整形は ruff と役割分担
          settings = {
            basedpyright = {
              analysis = { ignore = { '*' } }, -- リンター機能はRuffに任せる場合
            },
          },
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
