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
opt.iskeyword:append("_")
-- e.g., if you type dw at the beginning of hello_hello it will delete the whole thing

if vim.g.neovide then
  -- neovide settings
  opt.guifont = { "CaskaydiaMono Nerd Font Mono", ":h17" }
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

vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.templ'
