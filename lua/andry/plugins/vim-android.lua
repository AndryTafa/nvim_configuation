local setup, vim_android = pcall(require, "vim-android")
if not setup then
  return
end

vim_android.setup()
