require("ashok.core.options")
require("ashok.core.keymaps")
vim.api.nvim_create_autocmd({ "DirChanged" }, {
	pattern = "*",
	callback = function()
		vim.cmd([[ call chansend(v:stderr, printf("\033]7;file://%s\033\\", v:event.cwd)) ]])
	end,
})
