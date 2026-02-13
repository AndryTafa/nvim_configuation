-- Auto-adjust cursor visibility based on theme brightness
-- Works in both terminal and GUI Neovim

local function adjust_cursor()
  -- Check if light theme is active
  local is_light = vim.o.background == "light"
  
  if is_light then
    -- For light themes: dark cursor with high contrast
    -- Set guicursor for block cursor with better visibility
    vim.opt.guicursor = {
      "n-v-c:block-Cursor/lCursor",
      "i-ci-ve:ver25-Cursor/lCursor",
      "r-cr:hor20-Cursor/lCursor",
      "o:hor50-Cursor/lCursor",
    }
    
    -- Set highlight groups for high contrast on light backgrounds (charcoal cursor)
    -- Using pure white text for maximum visibility of the character under cursor
    vim.api.nvim_set_hl(0, "Cursor", { fg = "#ffffff", bg = "#37474f", bold = true })
    vim.api.nvim_set_hl(0, "lCursor", { fg = "#ffffff", bg = "#455a64", bold = true })
    vim.api.nvim_set_hl(0, "CursorIM", { fg = "#ffffff", bg = "#546e7a", bold = true })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#90caf9", fg = "#000000" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#e3f2fd" })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#e3f2fd" })
    
    -- Debug message (remove after testing)
    -- vim.notify("Light theme detected - cursor adjusted", vim.log.levels.INFO)
  else
    -- For dark themes: reset to defaults or light cursor
    vim.opt.guicursor = {
      "n-v-c:block-Cursor/lCursor",
      "i-ci-ve:ver25-Cursor/lCursor",
      "r-cr:hor20-Cursor/lCursor",
      "o:hor50-Cursor/lCursor",
    }
    
    vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#ffffff", bold = true })
    vim.api.nvim_set_hl(0, "lCursor", { fg = "#000000", bg = "#eeeeee", bold = true })
    vim.api.nvim_set_hl(0, "CursorIM", { fg = "#000000", bg = "#dddddd", bold = true })
    vim.api.nvim_set_hl(0, "Visual", { bg = "#264f78" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2c2c2c" })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#2c2c2c" })
  end
end

-- Run on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = adjust_cursor,
  group = vim.api.nvim_create_augroup("CursorAdjust", { clear = true }),
})

-- Also run when background option changes
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = adjust_cursor,
  group = vim.api.nvim_create_augroup("CursorAdjustBackground", { clear = true }),
})

-- Run initially on startup (with slight delay to ensure colorscheme is loaded)
vim.defer_fn(adjust_cursor, 100)
