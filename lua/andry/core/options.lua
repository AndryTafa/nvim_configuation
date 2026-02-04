local opt = vim.opt -- for conciseness

-- line number
opt.relativenumber = true
opt.number = true

-- default tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = false

-- minimal number of screen lines to keep above and below the cursor
opt.scrolloff = 10

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- split windows
opt.splitright = true
opt.splitbelow = true

-- misc
opt.iskeyword:remove("_")

if vim.g.neovide then
  -- neovide settings
  opt.guifont = { "CaskaydiaMono Nerd Font Mono", ":h15" }
  -- vim.g.neovide_transparency = 0.95

  -- Copy
  vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

  -- Cut
  vim.api.nvim_set_keymap('n', '<C-x>', '"+d', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', '<C-x>', '"+d', { noremap = true, silent = true })

  -- Paste
  vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })
end

-- Specific settings for Go files using autocommand
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vue", "javascript", "typescript" },
  callback = function()
    vim.schedule(function()
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "kt",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "xml",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "templ",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.g.scratchpad_autostart = 0
-- vim.g.scratchpad_location = '~/README.md'

-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     -- Make sure the plugin is loaded (useful if you're lazy-loading)
--     pcall(vim.cmd, "ZenMode")
--   end,
-- })

vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.templ, *.vue'
vim.api.nvim_set_hl(0, "IblIndent", { fg = "#6a6a6a", nocombine = true })
