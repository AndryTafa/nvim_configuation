local setup, vim_fugitive = pcall(require, "vimfugitive")
if not setup then
  return
end

vim_fugitive.setup()
