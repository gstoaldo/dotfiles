return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame_opts = {
				delay = 0,
			},
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" }, -- GitHub integration for :GBrowse
}
