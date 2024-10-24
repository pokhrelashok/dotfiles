return {
	"mg979/vim-visual-multi",
	config = function()
		vim.g.VM_default_mappings = 0
		vim.keymap.set("n", "<C-d>", "<Plug>(VM-Find-Under)")
	end,
}
