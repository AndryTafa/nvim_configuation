local setup, truezen = pcall(require, "true-zen")
if not setup then
  return
end

  truezen.setup({
    ui = {
      bottom = {
        laststatus = 0,
        ruler = false,
        showmode = false,
        showcmd = false,
        cmdheight = 0,
      },
      top = {
        showtabline = 0,
      },
      left = {
        hidden_number = false,
        hidden_relativenumber = false,
        hidden_singlecolumn = "no",

        show_number = true,
        show_relative_number = true,
        signcolumn = "yes",
      },
    },
    modes = {
      ataraxis = {
        left_padding = 32,
        right_padding = 32,
        top_padding = 0,
        bottom_padding = 0,
        ideal_writing_area_width = { 0 },
        auto_padding = true,
        keep_default_fold_fillchars = true,
        custom_bg = "",
        bg_configuration = true,
        affected_higroups = {
          NonText = {},
          FoldColumn = {},
          ColorColumn = {},
          VertSplit = {},
          StatusLine = {},
          StatusLineNC = {},
          SignColumn = {},
        },
      },
      focus = {
        margin_of_error = 5,
        focus_method = "experimental",
      },
    },
    integrations = {
      vim_gitgutter = false,
      galaxyline = false,
      tmux = true,
      gitsigns = false,
      nvim_bufferline = false,
      limelight = false,
      vim_airline = false,
      vim_powerline = false,
      vim_signify = false,
      express_line = false,
      lualine = false,
    },
    misc = {
      on_off_commands = false,
      ui_elements_commands = false,
      cursor_by_mode = false,
    },
  })

truezen.setup()
