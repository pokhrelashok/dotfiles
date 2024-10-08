return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			pickers = {
				oldfiles = {
					cwd_only = true,
				},
				find_files = {
					cwd_only = true,
				},
			},
			defaults = {
				file_ignore_patterns = {
					".git/",
					"node_modules/",
					".npm/",
					"*[Cc]ache/",
					"*-cache*",
					".dropbox/",
					".dropbox_trashed/",
					"*.py[co]",
					"*.sw?",
					"*~",
					"*.sql",
					"*.tags*",
					"*.gemtags*",
					"*.csv",
					"*.tsv",
					"*.tmp*",
					"*.old",
					"*.plist",
					"*.pdf",
					"*.log",
					"*.jpg",
					"*.jpeg",
					"*.png",
					"*.tar.gz",
					"*.tar",
					"*.zip",
					"*.class",
					"*.pdb",
					"*.dll",
					"*.dat",
					"*.mca",
					"__pycache__",
					".mozilla/",
					".electron/",
					".vpython-root/",
					".gradle/",
					".nuget/",
					".cargo/",
					".evernote/",
					".azure-functions-core-tools/",
					"yay/",
					".local/share/Trash/",
					".local/share/nvim/swap/",
					"code%-other/",
					"vendor",
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
	end,
	-- Map a shortcut to open the picker.
}
