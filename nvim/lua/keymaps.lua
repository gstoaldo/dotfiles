-- File Navigation
local snacks = require("snacks")

vim.keymap.set("n", "<C-p>", function()
	snacks.picker.smart({
		multi = { "buffers", "files" },
	})
end)
vim.keymap.set("n", "<C-f>", snacks.picker.grep)
vim.keymap.set("n", "<C-g>", snacks.picker.git_status)
vim.keymap.set("n", "<leader><leader>", snacks.picker.buffers)

-- Debugger
local dap = require("dap")

local prefix = "<leader>z"

local maps = {
	p = dap.continue,
	b = dap.toggle_breakpoint,
	c = dap.run_to_cursor,
	i = dap.step_into,
	o = dap.step_over,
	O = dap.step_out,
	r = dap.restart,
	t = dap.repl.toggle,
}

for key, fn in pairs(maps) do
	vim.keymap.set("n", prefix .. key, fn)
end
