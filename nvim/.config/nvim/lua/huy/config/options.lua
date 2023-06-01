local opt = vim.opt -- for conciseness

-- Disable C++ "offset_encoding" error until this bug is fixed
local notify = vim.notify
vim.notify = function(msg, ...)
	if
		msg:match(
			"warning: multiple different client offset_encodings"
		)
	then
		return
	end

	notify(msg, ...)
end
-- ~ Line
vim.opt.fillchars = "eob: "

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.breakindent = true -- enable break indent

-- Undo
opt.undofile = true -- save undo history

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- set completeopt to have a better completion experience
opt.completeopt = "menu,menuone,noselect"

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.colorcolumn = "80" -- show color column at 80 characters
opt.conceallevel = 0 -- show special characters

-- Sets conceal level to 0 when entering buffer
-- (For Markdown)
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("ConcealLevel", { clear = true })
autocmd("BufEnter", {
	group = "ConcealLevel",
	callback = function()
		vim.opt.conceallevel = 0
	end,
})
-- autocmd('InsertLeave', {
--   group = 'ConcealLevel',
--   callback = function()
--     vim.opt.conceallevel = 2
--   end
--})

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- fucntionality

-- decrease updatetime
opt.updatetime = 250
opt.timeout = true
opt.timeoutlen = 300

opt.iskeyword:append("-") -- consider string-string as whole word
