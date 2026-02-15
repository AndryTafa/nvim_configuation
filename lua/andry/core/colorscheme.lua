-- unsafe way:
-- vim.cmd("colorscheme nightfly")

-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- if not status then
--  print("Colorscheme not found")
--  return
-- end

require("monokai-nightasty").setup({
  dark_style_background = "transparent",
})

vim.g.zenbones_transparent_background = false

require("monokai-pro").setup({
  transparent_background = false,
})

require("github-theme").setup({
  options = {
    transparent = false,
  }
})

require('gruvbox').setup({
  transparent_mode = false,
})

require('vscode').setup({
  transparent = false,
})

require('night-owl').setup({
  transparent_background = false,
})

require("nox").setup({
  theme = "dark",              -- "dark", "light", or "umbra"
  transparent = false,         -- Enable transparent background
})

require("catppuccin").setup({
  transparent_background = false,
  float = {
    transparent = false, -- enable transparent floating windows
    solid = false, -- use solid styling for floating windows, see |winborder|
  },
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15, -- percentage of the shade to apply to the inactive window
  },
})

-- require("tokyonight").setup({
--   transparent = false,
--
--   style = "night",
--
--   on_colors = function(colors)
--     local bg = "#011628"
--     local bg_dark = "#011423"
--     local bg_highlight = "#143652"
--     local bg_search = "#0A64AC"
--     local bg_visual = "#275378"
--     local fg = "#CBE0F0"
--     local fg_dark = "#B4D0E9"
--     local fg_gutter = "#627E97"
--     local border = "#547998"
--
--     colors.bg = bg
--     colors.bg_dark = bg_dark
--     colors.bg_float = bg_dark
--     colors.bg_highlight = bg_highlight
--     colors.bg_popup = bg_dark
--     colors.bg_search = bg_search
--     colors.bg_sidebar = bg_dark
--     colors.bg_statusline = bg_dark
--     colors.bg_visual = bg_visual
--     colors.border = border
--     colors.fg = fg
--     colors.fg_dark = fg_dark
--     colors.fg_float = fg
--     colors.fg_gutter = fg_gutter
--     colors.fg_sidebar = fg_dark
--   end,
-- })

-- setup must be called before loading
-- vim.cmd.colorscheme "catppuccin"
require("rose-pine").setup({
  variant = "auto",
  dark_variant = "moon",

  palette = {
    main = {
      base = "#000000", 
      surface = "#111111",
      overlay = "#1a1a1a",
      muted = "#5e5a76", 
      subtle = "#8884a0",
      text = "#d0cee6", 

      -- moon palette accents
      gold = "#f6d5a7",
      foam = "#a1d1da",
      iris = "#d9c7ef",
      rose = "#ebbcba",
      pine = "#437e91",

      -- highlight shades
      highlight_low = "#1a1a1a",
      highlight_med = "#2a2a2a",
      highlight_high = "#3a3a3a",
    },
  },

  highlight_groups = {
    -- base UI
    Normal = { bg = "#000000", fg = "#d0cee6" },
    NormalNC = { bg = "#000000", fg = "#8884a0" },
    Cursor = { bg = "#ffffff", fg = "#000000" },
    Directory = { fg = "#a1d1da", bold = true }, -- bold for visibility

    -- statusline
    StatusLine = { bg = "#1a1a1a", fg = "#d0cee6" }, -- more contrast
    StatusLineTerm = { link = "StatusLine" },
    StatusLineNC = { bg = "#111111", fg = "#8884a0" }, -- dimmer inactive

    -- gitsigns
    StatusLineGitSignsAdd = { bg = "#1a1a1a", fg = "#4a9e91" }, -- brighter pine
    StatusLineGitSignsChange = { bg = "#1a1a1a", fg = "#f6d5a7" },
    StatusLineGitSignsDelete = { bg = "#1a1a1a", fg = "#f0a0a0" }, -- more visible rose

    -- diagnostics
    StatusLineDiagnosticSignError = { bg = "#1a1a1a", fg = "#e08f9b" }, -- stronger red
    StatusLineDiagnosticSignWarn = { bg = "#1a1a1a", fg = "#f6d5a7" },
    StatusLineDiagnosticSignInfo = { bg = "#1a1a1a", fg = "#a1d1da" },
    StatusLineDiagnosticSignHint = { bg = "#1a1a1a", fg = "#d9c7ef" },
    StatusLineDiagnosticSignOk = { bg = "#1a1a1a", fg = "#4a9e91" },
  },
})

vim.cmd("colorscheme rose-pine-main")
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
-- vim.cmd("colorscheme catppuccin-latte")
vim.opt.background = "light"
vim.cmd("colorscheme vercel")

-- Make floating windows (hover, etc.) more visible
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#f5f5f5", fg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#f5f5f5", fg = "#0066cc" })
vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#f5f5f5", fg = "#0066cc", bold = true })
-- vim.cmd("colorscheme vscode")
-- vim.cmd("colorscheme onedark_dark")
-- vim.cmd("colorscheme kanagawa")
