return {
	"nvim-ts-autotag",
	config = function()
		local ts = require("nvim-ts-autotag")
		ts.setup({
			opts = {
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
			},
		})
	end,
}
