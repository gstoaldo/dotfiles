return {
	"nvim-telescope/telescope.nvim",
	enabled = false,
	tag = "v0.1.9",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		defaults = {
			layout_strategy = "vertical",
		},
		pickers = {
			live_grep = {
				layout_config = {
					preview_cutoff = 0,
					preview_height = 0.5,
				},
			},
			buffers = {
				sort_mru = true,
			},
		},
	},
}
