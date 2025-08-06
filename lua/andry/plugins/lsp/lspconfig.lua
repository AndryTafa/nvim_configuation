local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvm_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
  return
end

local keymap = vim.keymap

-- enable keybinds only for when lsp sever is available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  --keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  keymap.set("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for line
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  keymap.set("n", "<leader>pe", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  keymap.set("n", "<leader>ne", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  keymap.set("n", "<leader>sd", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
  -- show all used instance of variable or class
  keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

  if client.name == 'svelte' then
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      callback = function(ctx)
        client.notify("$/onDidChangeTsOrJsFile", { uri = vim.uri_from_bufnr(ctx.buf) })
      end,
      group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
    })
  end

  if client.name == "ts_ls" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
end

-- used to enable autocompletion
-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = cmp_nvm_lsp.default_capabilities()


lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "templ", "eelixir" },
})

lspconfig["templ"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "templ" },
})

lspconfig["svelte"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
})

lspconfig["kotlin_language_server"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["gopls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

vim.filetype.add({
  extension = {
    templ = "templ",
  },
  pattern = {
    ['.*%.blade%.php'] = 'php',
    ['.*%.heex'] = "heex",
    ['.*%.eex'] = "eex",
  },
})

lspconfig["intelephense"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "php" },
})

-- -- /Users/andrytafa/.cache/nvim/elixir-tools.nvim/installs/elixir-lsp/elixir-ls/tags_v0.22.0/1.18.1-27/language_server.sh
-- lspconfig["elixir-ls"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   -- cmd = { "/Users/andrytafa/.cache/nvim/elixir-tools.nvim/installs/elixir-lsp/elixir-ls/tags_v0.22.0/1.18.1-27/language_server.sh" },
-- })

require("elixir").setup({
  nextls = {
    enable = false,
  },
  elixirls = {
    enable = true,
    settings = {
      elixirLS = {
        dialyzerEnabled = true,
        fetchDeps = false,
        enableTestLenses = true,
        suggestSpecs = false,
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  },
  projectionist = {
    enable = true,
  },
})

lspconfig["ts_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "js", "ts" },
})

-- lspconfig["rust-analyzer"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach
-- })

lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "css", "scss", "less" }
})

lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "html", "templ", "astro", "javascript", "typescript",
    "react", "svelte", "vue", "php", "heex", "elixir", "eelixir"
  },
  init_options = {
    userLanguages = {
      heex    = "html",
      eelixir = "html-eex",
      elixir  = "html-eex",  -- Treat Elixir files (with ~H sigils) as HTML-EEx
    },
  },
  root_dir = function(fname)
    return lspconfig.util.root_pattern(
      "mix.exs",               -- Phoenix project marker
      "tailwind.config.js",
      "tailwind.config.ts",
      "postcss.config.js",
      "package.json",
      "node_modules"
    )(fname)
      or vim.loop.cwd()
  end,
})

lspconfig["htmx"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "templ" },
})

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "heex", "eex", "css" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

