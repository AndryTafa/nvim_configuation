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
  { "catppuccin/nvim",                         name = "catppuccin", priority = 1000 },
  { "bluz71/vim-nightfly-guicolors" },
  { "bluz71/vim-moonfly-colors" },
  { "olimorris/onedark.nvim" },
  { "loctvl842/monokai-pro.nvim" },
  { "projekt0n/github-nvim-theme" },
  { "Mofiqul/vscode.nvim" },
  { "ThePrimeagen/harpoon" },
  { "ellisonleao/gruvbox.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "folke/tokyonight.nvim" },
  { "sainnhe/edge" },
  { "shaunsingh/nord.nvim" },
  { "sainnhe/gruvbox-material" },
  { "dark-orchid/neovim" },
  { "slugbyte/lackluster.nvim" },
  { "arzg/vim-colors-xcode" },
  { "rose-pine/neovim",                        name = "rose-pine" },
  { "rebelot/kanagawa.nvim" },
  { "zenbones-theme/zenbones.nvim" },
  { "nickkadutskyi/jb.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "katawful/kat.nvim", tag = "3.1" },
  { "marko-cerovac/material.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "NLKNguyen/papercolor-theme" },
  { "cocopon/iceberg.vim" },
  {
    'nmassardot/nvim-preview-svg',
    config = function()
      require('nvim-preview-svg').setup({ })
    end,
  },
  {
    'clearaspect/onehalf',
    lazy = false,
    priority = 1000,
  },
  {
    "tiesen243/vercel.nvim",
    lazy = false,
    config = function()
      require("vercel").setup({
        theme = "light",       -- String: Sets the theme to light or dark (Default: light)
        transparent = false,   -- Boolean: Sets the background to transparent (Default: false)
        italics = {
          comments = true,   -- Boolean: Italicizes comments (Default: true)
          keywords = false,   -- Boolean: Italicizes keywords (Default: true)
          functions = false,  -- Boolean: Italicizes functions (Default: true)
          strings = false,    -- Boolean: Italicizes strings (Default: true)
          variables = false,  -- Boolean: Italicizes variables (Default: true)
          bufferline = false -- Boolean: Italicizes bufferline (Default: false)
        },
        overrides = {
          Pmenu = { bg = "#cccccc", fg = "#000000" },
          PmenuSel = { bg = "#b8b8b8", fg = "#000000" },
        },        -- A dictionary of group names, can be a function returning a dictionary or a table.
      })

      -- This must be called before setting the colorscheme, otherwise it will always default to light mode
      vim.cmd.colorscheme("vercel")
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({})
    end,
  },
  { "shaunsingh/seoul256.nvim" },
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        -- optional configuration here
      }
      require('bamboo').load()
    end,
  },
  { "rktjmp/lush.nvim" },
  { 'oxfist/night-owl.nvim' },
  { "https://github.com/codeomnium-x/nox.nvim" },
  { "tjdevries/colorbuddy.nvim" },
  { "tjdevries/gruvbuddy.nvim" },
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
  {
    'wakatime/vim-wakatime',
    lazy = false
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

  -- File manager
  {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "echasnovski/mini.icons" },
    lazy = false,
    config = function()
      require("andry.plugins.fyler")
    end,
  },

  -- Editing helpers
  { "tpope/vim-surround" },
  { "vim-scripts/ReplaceWithRegister" },
  { "numToStr/Comment.nvim" },
  {
    "ThePrimeagen/99",
    config = function()
      local _99 = require("99")

      -- For logging that is to a file if you wish to trace through requests
      -- for reporting bugs, i would not rely on this, but instead the provided
      -- logging mechanisms within 99.  This is for more debugging purposes
      local cwd = vim.uv.cwd()
      local basename = vim.fs.basename(cwd)
      _99.setup({
        logger = {
          level = _99.ERROR,
          path = "/tmp/" .. basename .. ".99.debug",
          print_on_error = true,
        },

        --- A new feature that is centered around tags
        completion = {
          --- Defaults to .cursor/rules
          -- I am going to disable these until i understand the
          -- problem better.  Inside of cursor rules there is also
          -- application rules, which means i need to apply these
          -- differently
          -- cursor_rules = "<custom path to cursor rules>"

          --- A list of folders where you have your own SKILL.md
          --- Expected format:
          --- /path/to/dir/<skill_name>/SKILL.md
          ---
          --- Example:
          --- Input Path:
          --- "scratch/custom_rules/"
          ---
          --- Output Rules:
          --- {path = "scratch/custom_rules/vim/SKILL.md", name = "vim"},
          --- ... the other rules in that dir ...
          ---
          custom_rules = {
            "scratch/custom_rules/",
          },

          --- What autocomplete do you use.  We currently only
          --- support cmp right now
          source = "cmp",
        },

        --- WARNING: if you change cwd then this is likely broken
        --- ill likely fix this in a later change
        ---
        --- md_files is a list of files to look for and auto add based on the location
        --- of the originating request.  That means if you are at /foo/bar/baz.lua
        --- the system will automagically look for:
        --- /foo/bar/AGENT.md
        --- /foo/AGENT.md
        --- assuming that /foo is project root (based on cwd)
        md_files = {
          "AGENT.md",
        },
      })

      -- Space+k in visual mode for 99 visual selection with prompt
      vim.keymap.set("x", "<leader>k", function()
        _99.visual_prompt()
      end, { noremap = true, silent = true })

      -- Stop all 99 requests with leader+9+s
      vim.keymap.set({ "n", "v" }, "<leader>9s", function()
        _99.stop_all_requests()
      end, { noremap = true, silent = true })
    end,
  },

  -- Autopairs + autotag
  { "windwp/nvim-autopairs" },
  { "windwp/nvim-ts-autotag" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  -- Rainbow delimiters for colored parentheses
  {
      "HiPhish/rainbow-delimiters.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
        require("andry.plugins.rainbow-delimiters")
      end,
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
    opts = {}                  -- your configuration
  },

  -- LSP, mason, saga, ts, null-ls
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "glepnir/lspsaga.nvim",                branch = "main" },
  -- { "jose-elias-alvarez/typescript.nvim" },
  { "nvimtools/none-ls.nvim" }, -- null-ls successor
  { "jay-babu/mason-null-ls.nvim" }, -- updated repo for mason-null-ls.nvim

  -- Terminal
  { "akinsho/toggleterm.nvim",             version = "*" },

  -- UI niceties
  { "NvChad/nvim-colorizer.lua" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
  { "karb94/neoscroll.nvim" },
  { "stevearc/oil.nvim" },
  { "RRethy/vim-illuminate" },
  { "folke/zen-mode.nvim" },
  { "folke/todo-comments.nvim",            dependencies = { "nvim-lua/plenary.nvim" } },
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
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
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
      backend = "kitty", -- or "ueberzug" if you use that
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

  { 'MunifTanjim/nui.nvim' },
  { 'VonHeikemen/fine-cmdline.nvim' },

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
