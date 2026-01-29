-- ~/.EverVim/lua/andry/lazy-setup.lua

-- Ensure your custom config directory is on runtimepath
vim.opt.rtp:prepend(vim.fn.expand("~/.EverVim"))

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Colorschemes (load early)
  {"catppuccin/nvim", name = "catppuccin", priority = 1000},
  {"bluz71/vim-nightfly-guicolors"},
  {"bluz71/vim-moonfly-colors"},
  {"olimorris/onedark.nvim"},
  {"loctvl842/monokai-pro.nvim"},
  {"projekt0n/github-nvim-theme"},
  {"Mofiqul/vscode.nvim"},
  {"ThePrimeagen/harpoon"},
  {"ellisonleao/gruvbox.nvim"},
  {"EdenEast/nightfox.nvim"},
  {"folke/tokyonight.nvim"},
  {"sainnhe/edge"},
  {"shaunsingh/nord.nvim"},
  {"sainnhe/gruvbox-material"},
  {"dark-orchid/neovim"},
  {"slugbyte/lackluster.nvim"},
  {"arzg/vim-colors-xcode"},
  {"rose-pine/neovim", name = "rose-pine"},
  {"rebelot/kanagawa.nvim"},
  {"zenbones-theme/zenbones.nvim"},
  {"nickkadutskyi/jb.nvim"},
  {"nyoom-engineering/oxocarbon.nvim"},
  {"rktjmp/lush.nvim"},
  {'oxfist/night-owl.nvim'},
  {"https://github.com/codeomnium-x/nox.nvim"},
  { "lukas-reineke/virt-column.nvim", opts = {} },

  -- Core libs
  { "nvim-lua/plenary.nvim" },
  { "nvim-lua/popup.nvim" },

  -- Telescope (+ fzf-native + media_files)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      {
        "nvim-telescope/telescope-media-files.nvim",
        dependencies = { "nvim-lua/popup.nvim" },
      },
    },
  },

  -- Icons
  { "kyazdani42/nvim-web-devicons" },
  { "ryanoasis/vim-devicons" }, -- legacy; keep only if you really need it

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Navigation / windows
  { "christoomey/vim-tmux-navigator" },
  { "szw/vim-maximizer" },

  -- Editing helpers
  { "tpope/vim-surround" },
  { "vim-scripts/ReplaceWithRegister" },
  { "numToStr/Comment.nvim" },

  -- Autopairs + autotag
  { "windwp/nvim-autopairs" },
  { "windwp/nvim-ts-autotag" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  -- Git
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },
  { "sindrets/diffview.nvim" },

  -- Completion + snippets
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  { "onsails/lspkind.nvim" },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {} -- your configuration
  },

  -- LSP, mason, saga, ts, null-ls
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "glepnir/lspsaga.nvim", branch = "main" },
  -- { "jose-elias-alvarez/typescript.nvim" },
  { "nvimtools/none-ls.nvim" }, -- null-ls successor
  { "jay-babu/mason-null-ls.nvim" }, -- updated repo for mason-null-ls.nvim

  -- Terminal
  { "akinsho/toggleterm.nvim", version = "*" },

  -- UI niceties
  { "NvChad/nvim-colorizer.lua" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
  { "karb94/neoscroll.nvim" },
  { "stevearc/oil.nvim" },
  { "RRethy/vim-illuminate" },
  { "folke/zen-mode.nvim" },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "mvllow/modes.nvim" },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require("colorful-winsep").setup()
    end,
  },

  -- Motion
  { "easymotion/vim-easymotion" },
  { "rlane/pounce.nvim" },

  -- Misc
  { "edluffy/hologram.nvim" },
  { "rachartier/tiny-inline-diagnostic.nvim" },
  { "OlegGulevskyy/better-ts-errors.nvim" },
  { "ThePrimeagen/vim-be-good" },
  { "m4xshen/hardtime.nvim" },
  { "Aasim-A/scrollEOF.nvim" },
  { "joerdav/templ.vim" },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter'},
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      code = {
        -- Remove the thick language bar & top/bottom borders on fenced code blocks.
        border = 'none',
        language_border = ' ',
        above = ' ',
        below = ' ',
        highlight_border = false,
        width = 'block',
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
  },
  {
    'TobinPalmer/pastify.nvim',
    cmd = { 'Pastify', 'PastifyAfter' },
    config = function()
      require('pastify').setup {
        opts = {
          apikey = "",
        },
      }
    end
  },
  { "sitiom/nvim-numbertoggle" },
  { "nvzone/volt" },
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "FraserLee/ScratchPad" },
  {
    "3rd/image.nvim",
    opts = {
      processor = "magick_rock", -- use ffi
      backend = "kitty",         -- or "ueberzug" if you use that
    },
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      -- cfg options
    },
  },
  {
    "polirritmico/monokai-nightasty.nvim",
  },
  {
    'oribarilan/lensline.nvim',
    tag = '1.0.0', -- or: branch = 'release/1.x' for latest non-breaking updates
    event = 'LspAttach',
    -- config = function()
    --   require("lensline").setup()
    -- end,
  },

  {'MunifTanjim/nui.nvim'},
  {'VonHeikemen/fine-cmdline.nvim'},

  -- Debugging
  { "mfussenegger/nvim-dap" },

  -- Elixir tools
  {
    "elixir-tools/elixir-tools.nvim",
    tag = "stable",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
},
  {
    ui = { border = "rounded" },
    change_detection = { notify = false },
  })
