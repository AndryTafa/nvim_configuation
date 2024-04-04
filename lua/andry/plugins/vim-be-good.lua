local setup, vim_be_good = pcall(require, "vim-be-good")
if not setup then
  return
end

vim_be_good.setup()
