-- unsafe way:
-- vim.cmd("colorscheme nightfly")

-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- if not status then
--  print("Colorscheme not found")
--  return
-- end

vim.cmd("colorscheme onedark_vivid")

local status, _ = pcall(vim.cmd, "colorscheme onedarkpro")
if not status then
  print("Colorscheme not found")
  return
end
