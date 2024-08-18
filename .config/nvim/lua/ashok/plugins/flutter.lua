return {
	"akinsho/flutter-tools.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		local ft = require("flutter-tools")
		ft.setup({
			ui = {
				border = "rounded",
			},
			lsp = {
				color = {
					enabled = true,
					background = true,
				},
			},
		})
	end,
}
