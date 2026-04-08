local status, tailwind_tools = pcall(require, "tailwind-tools")
if not status then
  return
end

tailwind_tools.setup({
  server = {
    override = false, -- don't use the deprecated lspconfig path; tailwindcss is set up via lspconfig directly
  },
  document_color = {
    enabled = true,
    kind = "inline",
    inline_symbol = "󰝤 ",
    debounce = 200,
  },
  conceal = {
    enabled = false,
  },
  custom_filetypes = {
    "heex",
    "eelixir",
    "elixir",
  }
})
