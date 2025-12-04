---@diagnostic disable-next-line: undefined-global
---theme = Everforest Dark Hard
vim = vim

vim.opt.swapfile = false
vim.g.mapleader = " " -- Set <Space> as leader
vim.g.maplocalleader = " "

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 999
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.winborder = "rounded"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Identation
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- The "path" option allows us to specify a set of directories inside of which Vim
-- will search when the :find command is invoked
-- The ** wildcard matches all subdirectories beneath the working directory.
vim.opt.path = "**"

-- Install lazy.nvim
require("config.lazy")

--
-- KEYMAPS --
--

-- Clear highlight and close quickfix on Esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><cmd>cclose<CR><Esc>", { noremap = true, silent = true })

-- Faster movement (like <C-d> and <C-u> but for 5 lines)
vim.keymap.set({ "n", "v" }, "K", "5k", { noremap = true })
vim.keymap.set({ "n", "v" }, "J", "5j", { noremap = true })

vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>")

-- Toggle file explorer or go to previous buffer
vim.keymap.set("n", "<leader><tab>", "<cmd>b#<CR>")

-- Focus window
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Set color scheme
vim.o.termguicolors = true
vim.cmd.colorscheme("vague")
vim.cmd.colorscheme("catppuccin-latte")

-- LSP
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>T", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>R", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)

-- Diagnostics

-- Show diagnostics inline
vim.diagnostic.config({ virtual_text = true })

vim.keymap.set("n", "<leader>D", function()
	vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Line diagnostics" })

-- Copy path to clipboard and visual selection range
vim.keymap.set("v", "<leader>c", function()
	local relative_path = vim.fn.expand("%:.")

	-- Get visual selection range
	local start_line = vim.fn.line("v")
	local end_line = vim.fn.line(".")

	-- Ensure start_line <= end_line
	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	-- Format: path:start_line-end_line
	local result = string.format("%s:%d-%d", relative_path, start_line, end_line)

	vim.fn.setreg("+", result)
	print("Copied: " .. result)
end, { desc = "Copy relative path to clipboard" })

-- Copy github link to clipboard
vim.keymap.set({ "n", "v" }, "<leader>C", ":GBrowse!<CR>")

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>cclose<CR>")

-- Toggle comment
vim.keymap.set("n", "<C-/>", "gcc", { remap = true })
vim.keymap.set("v", "<C-/>", "gc", { remap = true })

local function create_terminal(name)
	vim.cmd("silent! b " .. name)

	if vim.bo.buftype ~= "terminal" then
		vim.cmd("term")
		vim.cmd("file " .. name)
	end

	vim.cmd("startinsert")
end

-- Open or create term:ai (used for AI CLI (claude, copilot, etc.))
vim.keymap.set("n", "<leader>ja", function()
	create_terminal("term:ai")
end)

-- General purpose terminal
vim.keymap.set("n", "<leader>jj", function()
	create_terminal("term:general")
end)

require("keymaps")
