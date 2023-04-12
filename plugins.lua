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

  {
    "folke/noice.nvim",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = false,
          },
          signature = {
            enabled = false,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        cmdline = {
          view = "cmdline",
        },
      }
    end,
  },

  {
    "folke/trouble.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("trouble").setup {}
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("todo-comments").setup {}
    end,
  },

  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    event = "LspAttach",
    -- config = function()
    --   require("nvim-code-action-menu").setup {}
    -- end,
  },

  {
    "mfussenegger/nvim-dap",
    event = "BufEnter",
    -- config = function()
    --   require("nvim-dap").setup {}
    -- end,
  },

  {
    "ggandor/leap.nvim",
    event = "BufEnter",
    config = function()
      require("leap").setup {}
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  {
    "skywind3000/asyncrun.vim",
    event = "CmdLineEnter",
  },

  {
    "neanias/everforest-nvim",
    lazy = false,
    config = function()
      require("everforest").setup {}
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
