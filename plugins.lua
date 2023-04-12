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

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  {
    "NMAC427/guess-indent.nvim",
    event = "BufEnter",
    config = function()
      require("guess-indent").setup {}
    end,
  },

  {
    "gelguy/wilder.nvim",
    event = "CmdLineEnter",
    config = function()
      local wilder = require "wilder"
      wilder.setup { modes = { ":", "/", "?" } }
      -- FIXIT: fuzzy search not working
      -- wilder.set_option("pipeline", {
      --   wilder.branch(
      --     wilder.python_file_finder_pipeline {
      --       file_command = { "fd", "-tf" },
      --       dir_command = { "fd", "-td" },
      --       -- use {'cpsm_filter'} for performance, requires cpsm vim plugin
      --       -- found at https://github.com/nixprime/cpsm
      --       filters = { "fuzzy_filter", "difflib_sorter" },
      --     },
      --     wilder.cmdline_pipeline {
      --       -- sets the language to use, 'vim' and 'python' are supported
      --       language = "python",
      --       -- 0 turns off fuzzy matching
      --       -- 1 turns on fuzzy matching
      --       -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
      --       fuzzy = 1,
      --     },
      --     wilder.python_search_pipeline {
      --       -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
      --       pattern = wilder.python_fuzzy_pattern(),
      --       -- omit to get results in the order they appear in the buffer
      --       sorter = wilder.python_difflib_sorter(),
      --       -- can be set to 're2' for performance, requires pyre2 to be installed
      --       -- see :h wilder#python_search() for more details
      --       engine = "re",
      --     }
      --   ),
      -- })
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
          highlights = {
            border = "Normal", -- highlight to use for the border
          },
          -- 'single', 'double', 'rounded' or 'solid'
          -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
          border = "rounded",
        })
      )
    end,
  },

  -- {
  --   "nvim-lualine/lualine.nvim"
  -- }

  -- status = {
  --   autosave = false, -- to autosave files
  -- },
}

return plugins
