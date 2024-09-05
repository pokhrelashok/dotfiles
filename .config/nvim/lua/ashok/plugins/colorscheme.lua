return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
		opts = function(_, opts)
			opts.transparent = true
			opts.italic_comments = true
			opts.borderless_telescope = false
		end,
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
		opts = function(_, opts)
			opts.transparent = true
			opts.italic_comments = true
			opts.borderless_telescope = false
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		opts = function(_, opts)
			opts.transparent = true
			opts.italic_comments = true
			opts.borderless_telescope = false
		end,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = function(_, opts)
			opts.transparent = true
			opts.italic_comments = true
			opts.borderless_telescope = false
		end,
	},
}
