local colors = {
  bg       = "NONE",
  fg       = "#f8f8f2",
  comment  = "#75715e",
  string   = "#e6db74",
  number   = "#be84ff",
  keyword  = "#f92672",
  storage  = "#f92672",
  type     = "#66d9ef",
  class    = "#66d9ef",
  func     = "#a6e22e", -- defs
  param    = "#fd971f",
  -- call     = "#f8f8f2", -- calls stay white
  operator = "#f92672", -- reddish (like keywords)
  boolean  = "#be84ff", -- purple
}

vim.opt.background = "dark"
vim.opt.termguicolors = true

-- base
vim.api.nvim_set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, "String", { fg = colors.string })
vim.api.nvim_set_hl(0, "Number", { fg = colors.number })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword, bold = true })
vim.api.nvim_set_hl(0, "Type", { fg = colors.type })
vim.api.nvim_set_hl(0, "Function", { fg = colors.func })
vim.api.nvim_set_hl(0, "Identifier", { fg = colors.param })

-- treesitter specifics
-- vim.api.nvim_set_hl(0, "@function.call", { fg = colors.call })     -- calls ≠ defs
vim.api.nvim_set_hl(0, "@function.builtin", { fg = colors.type }) -- builtins
vim.api.nvim_set_hl(0, "@operator", { fg = colors.operator })     -- +, =, *, etc.
vim.api.nvim_set_hl(0, "@boolean", { fg = colors.boolean })       -- true/false
