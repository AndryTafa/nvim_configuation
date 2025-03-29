local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true
  },
  indent = { enable = true },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = {
      'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
      'css', 'lua', 'xml', 'php', 'markdown', 'templ', 'go',
      'php', 'blade', 'blade.php',
      'heex', 'elixir', 'eex', 'eelixir', 'rust'
    },
  },
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
  },
  auto_install = true,
})

