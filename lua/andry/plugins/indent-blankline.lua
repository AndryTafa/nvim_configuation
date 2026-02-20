local highlight = {
    "IblIndent",
    "IblScope",
}

local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    if vim.o.background == "dark" then
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#333333", nocombine = true })
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#555555", nocombine = true })
    else
        vim.api.nvim_set_hl(0, "IblIndent", { fg = "#bbbbbb", nocombine = true })
        vim.api.nvim_set_hl(0, "IblScope", { fg = "#888888", nocombine = true })
    end
end)

require("ibl").setup({
    indent = {
        char = "▏", -- thin left-aligned line (Left One Eighth Block U+258F)
        highlight = highlight,
    },
    scope = {
        char = "▏",
        highlight = highlight,
    },
})
