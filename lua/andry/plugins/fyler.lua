local setup, fyler = pcall(require, "fyler")
if not setup then
  return
end

fyler.setup({
  hooks = {
    -- function(path) end
    on_delete = nil,
    -- function(src_path, dst_path) end
    on_rename = nil,
    -- function(hl_groups, palette) end
    on_highlight = nil,
  },
  integrations = {
    icon = "mini_icons",
  },
  views = {
    finder = {
      -- Close explorer when file is selected
      close_on_select = false,
      -- Auto-confirm simple file operations
      confirm_simple = false,
      -- Replace netrw as default explorer
      default_explorer = false,
      -- Move deleted files/directories to the system trash
      delete_to_trash = false,
      -- Git status
      git_status = {
        enabled = true,
        symbols = {
          Untracked = "?",
          Added = "+",
          Modified = "*",
          Deleted = "x",
          Renamed = ">",
          Copied = "~",
          Conflict = "!",
          Ignored = "#",
        },
      },
      -- Icons for directory states
      icon = {
        directory_collapsed = nil,
        directory_empty = nil,
        directory_expanded = nil,
      },
      -- Indentation guides
      indentscope = {
        enabled = true,
        group = "FylerIndentMarker",
        marker = "│",
      },
      -- Key mappings
      mappings = {
        ["q"] = "CloseView",
        ["<CR>"] = "Select",
        ["<C-t>"] = "SelectTab",
        ["|"] = "SelectVSplit",
        ["-"] = "SelectSplit",
        ["^"] = "GotoParent",
        ["="] = "GotoCwd",
        ["."] = "GotoNode",
        ["#"] = "CollapseAll",
        ["<BS>"] = "CollapseNode",
      },
      -- Current file tracking
      follow_current_file = true,
      -- File system watching(includes git status)
      watcher = {
        enabled = false,
      },
      -- Window configuration
      win = {
        border = vim.o.winborder == "" and "single" or vim.o.winborder,
        buf_opts = {
          filetype = "fyler",
          syntax = "fyler",
          buflisted = false,
          buftype = "acwrite",
          expandtab = true,
          shiftwidth = 2,
        },
        kind = "replace",
        kinds = {
          float = {
            height = "70%",
            width = "20%",
            top = "10%",
            left = "15%",
          },
          replace = {},
          split_above = {
            height = "70%",
          },
          split_above_all = {
            height = "70%",
            win_opts = {
              winfixheight = true, -- keep the window height fixed when other windows resize
            },
          },
          split_below = {
            height = "70%",
          },
          split_below_all = {
            height = "70%",
            win_opts = {
              winfixheight = true,
            },
          },
          split_left = {
            width = "20%",
          },
          split_left_most = {
            width = "20%",
            win_opts = {
              winfixwidth = true, -- keep the window width fixed when other windows resize
            },
          },
          split_right = {
            width = "30%",
          },
          split_right_most = {
            width = "30%",
            win_opts = {
              winfixwidth = true,
            },
          },
        },
        win_opts = {
          concealcursor = "nvic",
          conceallevel = 3,
          cursorline = false,
          number = false,
          relativenumber = false,
          winhighlight = "Normal:FylerNormal,NormalNC:FylerNormalNC",
          wrap = false,
        },
      },
    },
  },
})

-- Auto-open fyler on first file open
local first_file_opened = false

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    if not first_file_opened then
      first_file_opened = true
      require("fyler").toggle({ kind = "split_left_most" })
      vim.cmd.wincmd("l")
    end
  end,
})

-- Quit Neovim when all real buffers are closed (fyler buffer doesn't count)
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function()
    local buffers = vim.api.nvim_list_bufs()
    local has_real_buffer = false

    for _, bufnr in ipairs(buffers) do
      local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
      local buflisted = vim.api.nvim_get_option_value("buflisted", { buf = bufnr })

      if buflisted and buftype ~= "acwrite" then
        has_real_buffer = true
        break
      end
    end

    if not has_real_buffer then
      vim.cmd("qa")
    end
  end,
})
