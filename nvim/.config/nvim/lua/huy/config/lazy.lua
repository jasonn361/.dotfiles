-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- NOTE: First, some plugins that don't require any configuration

  -- -- Plugins dependency
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },
  "nvim-telescope/telescope-project.nvim",
  "debugloop/telescope-undo.nvim",

  -- Better Window Separator
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },

  -- Resize windows
  "anuvyklack/middleclass",
  "anuvyklack/animation.nvim",
  require("huy.plugins.windows"),

  -- Theme
  require("huy.config.colorscheme"),

  -- Essential plugins
  "tpope/vim-surround", -- easy add and delete surrounding punct.
  "inkarkat/vim-ReplaceWithRegister", -- copy and replace another word

  -- Word wrap for Markdown
  "preservim/vim-pencil",

  -- Better Scroll Bar
  require("huy.plugins.scrollbar"),

  -- Commentting
  require("huy.plugins.comment"),

  -- File Explorer
  require("huy.plugins.neo-tree"),
  require("huy.plugins.window-picker"),

  -- Tmux-vim navigator
  "christoomey/vim-tmux-navigator",

  -- Status Line
  require("huy.plugins.lualine"),

  -- Indentation guides
  require("huy.plugins.indent-blankline"),

  -- Treesitter
  require("huy.plugins.treesitter"),
  "nvim-treesitter/playground",

  -- Better Notifications
  require("huy.plugins.noice"),
  require("huy.plugins.nvim-notify"),

  -- Better Tabs
  require("huy.plugins.nvim-cokeline"),

  -- Dashboard
  require("huy.plugins.alpha-nvim"),

  -- Telescope
  require("huy.plugins.telescope"),

  -- Git related plugins
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  require("huy.plugins.gitsigns"),

  -- Better Diagnostics Alerts
  require("huy.plugins.trouble"),

  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  -- Essential Extensions
  "tpope/vim-surround",
  "inkarkat/vim-ReplaceWithRegister",

  -- Auto-completetion
  require("huy.plugins.nvim-cmp"),
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",

  -- Copilot
  require("huy.plugins.copilot"),

  -- Snippets
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",

  -- Managing and installing lsp servers
  { import = "huy.plugins.mason" },

  -- Configuring LSP servers
  "hrsh7th/cmp-nvim-lsp",
  { import = "huy.plugins.lsp" },

  -- Enhanced LSP UI
  "jose-elias-alvarez/typescript.nvim",
  "onsails/lspkind.nvim",

  -- Auto closing
  require("huy.plugins.autopairs"),
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Session Persistence
  require("huy.plugins.persistence"),

  -- HTML Live Preview
  "manzeloth/live-server",

  -- Smooth Cursor
  require("huy.plugins.smoothcursor"),

  -- Obsidian
  require("huy.plugins.obsidian"),

  -- Toggle Terminal
  require("huy.plugins.toggleterm"),
}

local opts = {
  -- Starup settings
  install = {
    colorscheme = { "tokyonight-night" },
  },

  -- Lazy UI customization
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = "rounded",
  },
}

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require("lazy").setup(plugins, opts)
