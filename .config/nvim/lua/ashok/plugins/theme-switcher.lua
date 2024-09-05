return {
	"zaldih/themery.nvim",
	config = function()
		local themery = require("themery")
		themery.setup({
			themes = {
				{
					name = "tokyonight",
					colorscheme = "tokyonight",
				},
				{
					name = "catpuccin",
					colorscheme = "catppuccin",
				},
				{
					name = "rose-pine",
					colorscheme = "rose-pine",
				},
				{
					name = "cyberdream",
					colorscheme = "cyberdream",
				},
			},
		})
		local keymap = vim.keymap

		keymap.set("n", "<leader>t", "<cmd>Themery<cr>", { desc = "Switch Themes" })
	end,
}
