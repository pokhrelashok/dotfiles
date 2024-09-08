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
				find_files = {
					find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
				},
			},
			extensions = {
				recent_files = {
					only_cwd = true,
					previewer = false,
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
				path = "smart",
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
		telescope.load_extension("recent_files")
		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope frecency workspace=CWD theme=dropdown previewer=false<cr>",
			{ desc = "Fuzzy find recent files" }
		)
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope frecency oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		vim.api.nvim_set_keymap(
			"n",
			"<leader>p",
			[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
			{ noremap = true, silent = true }
		)
	end,
	-- Map a shortcut to open the picker.
}
