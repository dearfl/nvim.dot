local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- general
  b.diagnostics.trail_space,

  -- markdown
  b.formatting.prettier.with { filetypes = { "markdown" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- python
  b.formatting.autopep8,
  b.formatting.isort,
  b.formatting.black,
  b.diagnostics.flake8,
  b.diagnostics.pylint,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
