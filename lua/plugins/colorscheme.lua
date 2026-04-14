return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
      })
      vim.cmd.colorscheme('catppuccin')
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      if vim.list == nil then
        vim.list = {}
      end
      if vim.list_contains == nil then
        function vim.list_contains(list, value)
          for _, v in ipairs(list or {}) do
            if v == value then
              return true
            end
          end
          return false
        end
      end
      if vim.list_extend == nil then
        function vim.list_extend(dest, src)
          for _, v in ipairs(src or {}) do
            dest[#dest + 1] = v
          end
          return dest
        end
      end
      if vim.list.unique == nil then
        function vim.list.unique(list)
          local seen = {}
          local out = {}
          for _, v in ipairs(list or {}) do
            if not seen[v] then
              seen[v] = true
              out[#out + 1] = v
            end
          end
          return out
        end
      end

      require('nvim-treesitter').setup({})

      local ts_config = require('nvim-treesitter.config')
      local installed = ts_config.get_installed('parsers')
      if not vim.tbl_contains(installed, 'haskell') then
        vim.notify('nvim-treesitter: Haskell parser is not installed. Run :TSInstall haskell', vim.log.levels.WARN)
      end

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'haskell' },
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
