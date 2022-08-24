local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  -- one of "all" or a list of languages
  ensure_installed = { "bash", "c", "cmake", "comment", "cpp", "dockerfile", "fish", "gitignore", "glsl", "haskell",
    "hlsl", "html", "http", "json", "julia", "kotlin", "latex", "llvm", "lua", "make", "markdown", "markdown_inline",
    "ninja", "nix", "perl", "python", "r", "regex", "rust", "scheme", "sql", "toml", "yaml", "vim" },
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "css" }, -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python", "yaml" } },
})
