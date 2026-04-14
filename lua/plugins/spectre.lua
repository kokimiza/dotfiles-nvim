return {
  {
    'nvim-pack/nvim-spectre',
    cmd = 'Spectre',
    opts = {
      color_devicons = true,
      open_cmd = 'noswapfile vnew',
      live_update = false,
      lsp_rename = true,
      line_sep = '━━━━━━━━━━',
      result_padding = '│  ',
      on_complete_replace = function(num)
        print('置換が完了しました: ' .. num .. ' 件')
      end,
      is_insert_mode = false,
    },
    keys = {
      {
        '<leader>sr',
        function()
          require('spectre').open()
        end,
        desc = 'Spectre を開く（置換）',
      },
      {
        '<leader>sw',
        function()
          require('spectre').open_visual({ select_word = true })
        end,
        desc = 'Spectre：単語を選択',
      },
      {
        '<leader>sp',
        function()
          require('spectre').open_file_search()
        end,
        desc = 'Spectre：ファイルを検索',
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
}
