local overrides = require "custom.configs.overrides"

local plugins = {
  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = { "dearfl/snippets", branch = "flr" },
      },
    },
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- {
  --   "nvim-lualine/lualine.nvim"
  -- }

  -- status = {
  --   autosave = false, -- to autosave files
  -- },
}

return plugins
