local status, ninetyfive = pcall(require, "ninetyfive")
if not status then
  return
end

ninetyfive.setup({
  enable_on_startup = false,
  use_cmp = false,
  mappings = {
    accept = "<Tab>",
    -- Keep the rest command-only to avoid conflicts with cmp and terminal navigation.
    accept_word = false,
    accept_line = false,
    reject = false,
  },
  indexing = {
    mode = "ask",
    cache_consent = true,
  },
})
