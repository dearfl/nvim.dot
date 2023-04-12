local g_vars = {
  -- lang specific
  python_recommended_style = 0,
  rust_recommended_style = 0,
  -- loaded_python3_provider = 1,

  -- use lua filedetect
  transparency = true,
}

local g_opt = {
  -- general
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  mouse = "", -- diable mouse

  backup = false, -- creahighlight all matches on previous search patterntes a backup file
  cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- smart case when searching
  pumheight = 12, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0, -- always show tabs
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 200, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 2, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = true, -- display lines as one long line
  scrolloff = 8, -- is one of my fav, keep minimal lines when scroll to the edge
  sidescrolloff = 8,
  -- guifont = "Hack:h17", -- the font used in graphical neovim applications

  -- Indenting
  expandtab = true, -- convert tabs to spaces
  smartindent = true, -- make indenting smarter again
  -- tabstop = 4, -- insert 4 spaces for a tab
  -- softtabstop = 4,
  -- shiftwidth = 4, -- the number of spaces inserted for each indentation
}

vim.opt.shortmess:append "sI"

for k, v in pairs(g_opt) do
  vim.opt[k] = v
end

for k, v in pairs(g_vars) do
  vim.g[k] = v
end
