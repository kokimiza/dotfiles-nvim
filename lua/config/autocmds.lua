vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

-- オートセーブ（INSERT modeを抜けたら保存）
vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    if vim.api.nvim_buf_get_option(buf, 'modified') then
      pcall(vim.cmd, 'silent write')
    end
  end,
  group = vim.api.nvim_create_augroup('AutoSave', { clear = true }),
})
