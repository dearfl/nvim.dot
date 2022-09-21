local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    -- formatting.black.with({ extra_args = { "--fast" } }),
    formatting.autopep8.with({ extra_args = { "--max-line-length=120" } }),
    -- already have ccls
    -- formatting.clang_format,
    formatting.rustfmt,
    diagnostics.trail_space,
    diagnostics.cppcheck.with({ extra_args = { "--std=c++20", "--language=c++" } }),
    diagnostics.flake8.with({ extra_args = { "--max-line-length=120" } }),
    -- not needed
    -- diagnostics.shellcheck,
    -- diagnostics.luacheck,
  },
})
