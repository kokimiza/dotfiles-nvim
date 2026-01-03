return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>t", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    },
    opts = {
      size = 15,
      open_mapping = false, -- 自前で管理
      direction = "horizontal",
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
    },
  },
}

