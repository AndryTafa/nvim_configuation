local status, autotag = pcall(require, "nvim-ts-autotag")
if not status then
	return
end

autotag.setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = true,
	},
	per_filetype = {
		["html"] = {
			enable_close = true,
		},
		["heex"] = {
			enable_close = true,
		},
		["eelixir"] = {
			enable_close = true,
		},
		["jsx"] = {
			enable_close = true,
		},
		["tsx"] = {
			enable_close = true,
		},
		["vue"] = {
			enable_close = true,
		},
		["svelte"] = {
			enable_close = true,
		},
		["php"] = {
			enable_close = true,
		},
		["xml"] = {
			enable_close = true,
		},
	},
})
