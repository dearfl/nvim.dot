---@type MappingsTable
local M = {}

M.disabled = {
    ["<leader>f"] = "",
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader><leader>"] = { "<C-^>", "switch between buffers", opts = { nowait = true } },
  },
}

M.telescope = {}

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

  },

  n = {
    -- toggle in normal mode
    ["<C-\\>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

  },
}


M.whichkey = {}

M.lspconfig = {
  n = {
    ["gl"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },
  }
}

-- more keybinds!

return M
