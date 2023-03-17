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
