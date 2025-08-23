-- unsafe way:
-- vim.cmd("colorscheme nightfly")

-- local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- if not status then
--  print("Colorscheme not found")
--  return
-- end
require("tokyonight").setup({
  transparent = true,
})

require("github-theme").setup({
  options = {
    transparent = true,
  }
})

require('gruvbox').setup({
    transparent_mode = true,
})

require('vscode').setup({
    transparent = true,
})

require('night-owl').setup({
    transparent_background = true,
})

require("catppuccin").setup({
    transparent_background = true,
    float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
    },
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
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
-- vim.cmd("colorscheme github_dark_dimmed")
vim.cmd("colorscheme vscode")

