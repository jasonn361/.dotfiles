-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert and view mode
keymap.set("i", "jk", "<ESC>")

-- save file
keymap.set("n", "<C-s>", ":w<CR>")

-- exit file
keymap.set("n", "<C-q>", ":q<CR>")
keymap.set("n", "<ESC>", ":q!<CR>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
-- keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sc", ":close<CR>") -- close current split window

keymap.set("n", "-", "<cmd>vertical resize +5<cr>")
keymap.set("n", "=", "<cmd>vertical resize -5<cr>")
keymap.set("n", "+", "<cmd>horizontal resize +2<cr>")
keymap.set("n", "_", "<cmd>horizontal resize -2<cr>")
--keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
--keymap.set("n", "<leader>tc", ":tabclose<CR>") -- close current tab
--keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
--keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Pandoc
keymap.set(
  "n",
  "<leader>Pp", -- Export as PDF
  "<cmd>TermExec cmd='pandoc -F mermaid-filter %:p -o %:p:r.pdf'<CR>"
)
keymap.set(
  "n",
  "<leader>Pw", -- Export as Word Doc
  "<cmd>TermExec cmd='pandoc -F %:p -o %:p:r.docx'<CR>"
)
keymap.set(
  "n",
  "<leader>Pm", --Export as Markdown
  "<cmd>TermExec cmd='pandoc -F %:p -o %:p:r.md'<CR>"
)
keymap.set(
  "n",
  "<leader>Pt", -- Export as LaTex
  "<cmd>TermExec cmd='pandoc -F mermaid-filter %:p -o %:p:r.tex'<CR>"
)

--------------------
-- Plugin Keybinds
--------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>")

-- Neo-Tree

-- Toggle Filesystem
-- keymap.set('n', '<leader>e', '<cmd>Neotree reveal left filesystem toggle<CR>')
keymap.set("n", "<leader>e", "<cmd>Neotree float filesystem toggle<CR>")
keymap.set("n", "<leader>r", "<cmd>Neotree float git_status toggle<CR>")

-- Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") -- find files within working dir, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>") -- find string in working dir
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>") -- find string under cursor in working dir
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>") -- list available help tags
keymap.set("n", "<leader>fp", "<cmd>Telescope project<CR>") -- find projects

-- Telescope Git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>") -- list all git commits
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<CR>") -- list git commits for current file/buffer
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<CR>") -- list git branches
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>") -- list current changes per file with diff preview

-- Telescope for notify
keymap.set("n", "<leader>fn", "<cmd>Telescope notify<CR>") -- list all error messages

-- Treesitter Playground
keymap.set("n", "<leader>la", "<cmd>TSPlaygroundToggle<CR>")

-- LSP
keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>") -- show definition, references
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>") -- go to declaration
keymap.set("n", "gd", "<cmd>Lspsaga peek_defintion<CR>") -- see definition and make edits in window
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>") -- go to implementation
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>") -- see available code actions
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>") -- smart rename
keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostic<CR>") -- show diagnostics line
keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostic<CR>") -- show diagnostics for cursor
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>") -- jump to previous diagnostic in buffer
keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>") -- jump to next diagnostic in buffer
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>") -- show documentation for what is under cursor
keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>") -- see outline on right hand side

-- Cokeline
keymap.set("n", "<leader>tf", "<Plug>(cokeline-pick-focus)")

keymap.set("n", "<leader>tn", "<Plug>(cokeline-focus-next)")
keymap.set("n", "<leader>tp", "<Plug>(cokeline-focus-prev)")

keymap.set("n", "<leader>tc", "<Plug>(cokeline-pick-close)")

-- Markdown Preview
keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>")
keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<CR>")

-- Window split resize
keymap.set("n", "<leader>sm", "<cmd>WindowsMaximize<CR>")
keymap.set("n", "<leader>s-", "<cmd>WindowsMaximizeVertically<CR>")
keymap.set("n", "<leader>s_", "<cmd>WindowsMaximizeHorizontally<CR>")
keymap.set("n", "<leader>se", "<cmd>WindowsEqualize<CR>")

-- Harpoon
--keymap.set('n', '<leader>a', require('harpoon.mark').add_file)
--keymap.set('n', '<S-e>', ui.toggle_quick_menu)

--keymap.set('n', )
