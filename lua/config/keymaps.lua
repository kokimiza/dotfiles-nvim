-- insert mode: jj -> Esc
vim.keymap.set("i", "jj", "<Esc>", {
  noremap = true,
  silent = true,
})
-- jj の体感速度調整
vim.opt.timeout = true
vim.opt.timeoutlen = 300

