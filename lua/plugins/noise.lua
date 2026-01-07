return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        timeout = 3000,
        max_height = function()
          return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
          return math.floor(vim.o.columns * 0.75)
        end,
      },
    },
  },
  opts = {
    -- cmdline UI をフローティングに
    cmdline = {
      view = "cmdline_popup",
    },

    -- 最低限の preset のみ
    presets = {
      bottom_search = true,     -- / ? は従来通り
      command_palette = true,  -- : と補完を一体化
      long_message_to_split = true,
    },
    lsp = {
      override = {
        -- cmp のドキュメントだけ noice に任せる
        ["cmp.entry.get_documentation"] = true,
      },
    },

    -- メッセージのノイズを減らす
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
    },
    progress = {
      enabled = true,
    },
  },
}
