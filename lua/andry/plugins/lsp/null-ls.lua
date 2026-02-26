local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local configs = require("lspconfig.configs")
if not configs.stylua then
  configs.stylua = {
    default_config = {
      cmd = { "stylua", "--stdio" },
      filetypes = { "lua" },
      root_dir = require("lspconfig.util").root_pattern("stylua.toml", ".stylua.toml", ".git"),
    },
  }
end

null_ls.setup({
  sources = {
    formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
    formatting.stylua,
    diagnostics.eslint_d
  },
  -- configure format on save
    on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
