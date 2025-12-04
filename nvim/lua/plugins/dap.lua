return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		require("dap-go").setup()
		require("nvim-dap-virtual-text").setup()

		vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#F38BA8" })
		vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	end,
}
