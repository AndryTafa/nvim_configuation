local setup, vimsmoothie = pcall(require, "vim-smoothie")
if not setup then
  return
end

vim.g.smoothie_center_cursor_after_scroll = 0
vim.g.smoothie_speed_linear_factor = 70



vimsmoothie.setup()
