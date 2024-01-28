vim.g.mapleader = " "

-- local function toggleNvimTreeFocus()
--     local nvimTreeBufType = vim.api.nvim_buf_get_option(0, 'filetype')
--     if nvimTreeBufType == 'NvimTree' then
--         vim.cmd('wincmd p')  -- Switch to the previous window
--     else
--         vim.cmd('NvimTreeFocus')  -- Focus on Nvim Tree
--     end
-- end


local keymap = vim.keymap
-- keymap.set("i", "jk", "<ESC>") not gonna use this, but it just means that in insert mode, pressing jk will act as pressing the escape key 

keymap.set('n', 'x', '"_x', { noremap = true, silent = true }) -- in normal mode, deleting character won't copy to register
keymap.set("n", "<leader>w", ":wa<CR>", { noremap = true, silent = true }) -- Keybinding to save all buffers
keymap.set("n", "<leader>h", ":noh<CR>", { noremap = true, silent = true }) -- Add a keybinding to clear search highlights
keymap.set("n", "<leader>l", ":b#<CR>", { noremap = true, silent = true }) -- Keybinding to switch to the last used buffer
keymap.set("n", "<leader>k", "0w", { noremap = true, silent = true }) -- Keybinding to switch to the last used buffer

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- center screen after ctrl-u and ctrl-d
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- center screen after j and k
-- keymap.set("n", "j", "jzz")
-- keymap.set("n", "k", "kzz")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- NvimTreeToggle
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>")
--keymap.set("n", "<leader>k", toggleNvimTreeFocus, { silent = true, noremap = true })

-- Plugin keymaps
keymap.set("n", "<leader>i", ":PackerInstall<CR>")

-- fuzzy finder - telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- easymotion 
-- keymap.set("n", "<leader>j", ":HopWord", { silent = true })

-- zenmode
keymap.set("n", "<leader>u", "<cmd>TZAtaraxis<cr>", { silent = true })
