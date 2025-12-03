-- File Navigation
local snacks = require("snacks")

vim.keymap.set("n", "<C-p>", snacks.picker.git_files)
vim.keymap.set("n", "<C-f>", snacks.picker.grep)
vim.keymap.set("n", "<C-g>", snacks.picker.git_status)

-- Debugger
local dap = require("dap")

local prefix = "<leader><leader>"

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
