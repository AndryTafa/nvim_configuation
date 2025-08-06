-- unsafe way:
-- vim.cmd("colorscheme nightfly")

-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- if not status then
--  print("Colorscheme not found")
--  return
-- end


--local status, _ = pcall(vim.cmd, "colorscheme onedarkpro")
--if not status then
--  print("Colorscheme not found")
--  return
-- end
--

vim.o.background = "dark"
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_background = 'medium';

-- vim.cmd('colorscheme gruvbox')
vim.cmd("colorscheme catppuccin-macchiato")
