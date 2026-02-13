vim.g.mapleader = " "

local keymap = vim.keymap
-- keymap.set("i", "jk", "<ESC>") not gonna use this, but it just means that in insert mode, pressing jk will act as pressing the escape key 

keymap.set('n', 'x', '"_x', { noremap = true, silent = true }) -- in normal mode, deleting character won't copy to register
keymap.set('n', '<Leader>w', ':wa<CR>', { noremap = true, silent = true })
keymap.set('n', '<Leader>r', ':lua indent_file()<CR>', { noremap = true, silent = true })
keymap.set("n", "<leader>h", ":noh<CR>", { noremap = true, silent = true }) -- Add a keybinding to clear search highlights
keymap.set("n", "<leader>l", ":b#<CR>", { noremap = true, silent = true }) -- Keybinding to switch to the last used buffer
keymap.set("n", "<leader>k", "0w", { noremap = true, silent = true }) -- Keybinding to switch to the last used buffer

keymap.set("v", "E", "$", { noremap = true, silent = true }) -- in visual mode, shift+e highlights to end of line

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- center screen after ctrl-u and ctrl-d
keymap.set("n", "<C-d>", "<C-d>zt", { noremap = true, silent = true })
keymap.set("n", "<C-u>", "<C-u>zt", { noremap = true, silent = true })
-- center screen after { and }

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Fyler file manager (toggle on the left)
keymap.set("n", "<leader>fi", function()
  require("fyler").toggle({ kind = "split_left_most" })
end, { silent = true, noremap = true, desc = "Toggle Fyler" })

--oil toggle
keymap.set("n", "<leader>oo", ":Oil<CR>")

-- Plugin keymaps
keymap.set("n", "<leader>i", ":Lazy install<CR>")

-- fuzzy finder - telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fz", "<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files<cr>")
keymap.set("n", "fa", "<cmd>Telescope lsp_references<cr>") -- fa for find all (references) instead of find refernce because it rolls better
keymap.set("n", "fd", "<cmd>Telescope lsp_definitions<cr>") -- fd for find definition
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string 
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- easymotion
vim.keymap.set("n", "<leader>j", "<Plug>(easymotion-bd-e)", { silent = true })

vim.api.nvim_set_keymap('n', '<leader><leader>1', ':colorscheme github_dark_dimmed<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader><leader>2', ':colorscheme catppuccin-latte | colorscheme vercel<CR>', { noremap = true, silent = true })


-- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
-- Set the keymap to call the globally defined function
function _G.indent_file()
  -- Save the current view state
  local view_state = vim.fn.winsaveview()
  -- Re-indent the entire file without mappings
  vim.cmd('normal! gg=G')
  -- Restore the view state
  vim.fn.winrestview(view_state)
end
