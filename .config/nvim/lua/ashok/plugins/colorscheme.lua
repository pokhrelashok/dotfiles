return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local cat = require("catppuccin")
			cat.setup({
				default_integrations = true,
				flavour = "mocha",
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
}
