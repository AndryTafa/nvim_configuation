-- NOTE: this file is to add lightweight dependencies that dont require a lot of setup

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
})

require('scrollEOF').setup()

-- require('modes').setup({
-- 	colors = {
-- 		delete = "#c75c6a",
-- 		copy = "#9745be",
-- 		inert = "#78ccc5",
-- 		visual = "#f5c359",
-- 	},
--
-- 	-- Set opacity for cursorline and number background
-- 	line_opacity = 0.15,
--
-- 	-- Enable cursor highlights
-- 	set_cursor = true,
--
-- 	-- Enable cursorline initially, and disable cursorline for inactive windows
-- 	-- or ignored filetypes
-- 	set_cursorline = true,
--
-- 	-- Enable line number highlights to match cursorline
-- 	set_number = true,
--
-- 	-- Disable modes highlights in specified filetypes
-- 	-- Please PR commonly ignored filetypes
-- 	ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
-- })
