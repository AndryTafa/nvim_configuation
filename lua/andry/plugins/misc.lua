-- NOTE: this file is to add lightweight dependencies that dont require a lot of setup

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
})

require('scrollEOF').setup()
require('fine-cmdline').setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ':'
  },
  popup = {
    position = {
      row = '10%',
      col = '30%',
    },
    size = {
      width = '60%',
    },
    border = {
      style = 'rounded',
    },
    win_options = {
      winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
    },
  },
})

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
