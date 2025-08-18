return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "vue",
          },
          settings = {
            typescript = {
              tsdk = vim.fn.stdpath("data")
                .. "/mason/packages/typescript/lib",
            },
          },
        },
      },
    },
  },
}
