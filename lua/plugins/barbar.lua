return {
  {
    'romgrk/barbar.nvim',
    event = 'VimEnter',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      animation = true,
      auto_hide = false,
      icons = {
        button = '',
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﲅ' },
          [vim.diagnostic.severity.WARN] = { enabled = true, icon = '▲' },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = false },
        },
        gitsigns = {
          added = { enabled = false },
          changed = { enabled = true, icon = 'M' },
          deleted = { enabled = false },
        },
        filetype = {
          enabled = true,
        },
        separator = {
          left = '▎',
          right = '',
        },
        modified = { button = '●' },
        pinned = { button = '📌' },
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = true },
        inactive = { button = nil },
        visible = { modified = { buffer_index = false } },
      },
      tabpages = true,
      no_name_title = nil,
    },
    keys = {
      { '<leader>1', '<cmd>BufferGoto 1<CR>', desc = 'バッファ 1 へ' },
      { '<leader>2', '<cmd>BufferGoto 2<CR>', desc = 'バッファ 2 へ' },
      { '<leader>3', '<cmd>BufferGoto 3<CR>', desc = 'バッファ 3 へ' },
      { '<leader>4', '<cmd>BufferGoto 4<CR>', desc = 'バッファ 4 へ' },
      { '<leader>5', '<cmd>BufferGoto 5<CR>', desc = 'バッファ 5 へ' },
      { '<leader>6', '<cmd>BufferGoto 6<CR>', desc = 'バッファ 6 へ' },
      { '<leader>7', '<cmd>BufferGoto 7<CR>', desc = 'バッファ 7 へ' },
      { '<leader>8', '<cmd>BufferGoto 8<CR>', desc = 'バッファ 8 へ' },
      { '<leader>9', '<cmd>BufferGoto 9<CR>', desc = 'バッファ 9 へ' },
      { '<leader>0', '<cmd>BufferLast<CR>', desc = '最後のバッファ' },
      { '<leader>bp', '<cmd>BufferPrevious<CR>', desc = '前のバッファ' },
      { '<leader>bn', '<cmd>BufferNext<CR>', desc = '次のバッファ' },
      { '<leader>b<', '<cmd>BufferMovePrevious<CR>', desc = 'バッファを左へ' },
      { '<leader>b>', '<cmd>BufferMoveNext<CR>', desc = 'バッファを右へ' },
      { '<leader>bd', '<cmd>BufferClose<CR>', desc = 'バッファを閉じる' },
      { '<leader>bD', '<cmd>BufferCloseAllButCurrentOrPinned<CR>', desc = 'その他を閉じる' },
      { '<leader>b!', '<cmd>BufferCloseAllButPinned<CR>', desc = 'ピン留めを残す' },
    },
  },
}
