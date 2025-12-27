local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true
  },
  indent = { enable = true },
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "templ",
    "css",
    "markdown",
    "svelte",
    "graphql",
    "lua",
    "bash",
    "vim",
    "dockerfile",
    "gitignore",
    "java",
    "rust",
    "c",
    "cpp",
    "vue",
    "xml",
    "elixir",
    "heex",
    "eex",
    "gleam",
  },
  auto_install = true,
})
