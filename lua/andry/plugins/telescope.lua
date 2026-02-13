local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
      }
    }
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "svg","jpeg", "webm"},
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    }
  },
})

telescope.load_extension("fzf")
telescope.load_extension("media_files")

-- Fix selection highlight for light colorschemes (vercel)
vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#d4d4d4", fg = "#000000", bold = true })
vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = "#0070f3", bold = true })
