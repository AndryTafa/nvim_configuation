local status, tailwind_tools = pcall(require, "tailwind-tools")
if not status then
  return
end

tailwind_tools.setup({
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
