-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader><ENTER>", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window split management
keymap.set("n", "<C-k>", "<C-w><Up>")
keymap.set("n", "<C-j>", "<C-w><Down>")
keymap.set("n", "<C-l>", "<C-w><Right>")
keymap.set("n", "<C-h>", "<C-w><Left>")

--tabs managenet
keymap.set("n", "<Leader>1", "1gt")
keymap.set("n", "<Leader>2", "2gt")
keymap.set("n", "<Leader>3", "3gt")
keymap.set("n", "<Leader>4", "4gt")
keymap.set("n", "<Leader>5", "5gt")
keymap.set("n", "<Leader>6", "6gt")
keymap.set("n", "<Leader>7", "7gt")
keymap.set("n", "<Leader>8", "8gt")
keymap.set("n", "<Leader>9", "9gt")
keymap.set("n", "th", ":tabfirst<CR>")
keymap.set("n", "tk", ":tabnext<CR>")
keymap.set("n", "tj", ":tabprev<CR>")
keymap.set("n", "tl", ":tablast<CR>")
keymap.set("n", "tm", ":tabm<Space>")
keymap.set("n", "td", ":tabclose<CR>")
keymap.set("n", "tn", ":tabnew<CR>")
keymap.set("n", "te", ":tabfind<Space>")

--save and quit
keymap.set("n", "<leader>w", ":w!<cr>")
keymap.set("n", "<leader>q", ":q<cr>")

--size window
keymap.set("n", "<C-,>", "<C-W><")
keymap.set("n", "<C-.>", "<C-W>>")
keymap.set("n", "<C-<>", "<C-W>-")
keymap.set("n", "<C->>", "<C-W>+")
---------------------
-- General Keymaps
---------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

--nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

vim.keymap.set("n", "<leader>mn", require("nvim-tree.api").marks.navigate.next)
vim.keymap.set("n", "<leader>mp", require("nvim-tree.api").marks.navigate.prev)
vim.keymap.set("n", "<leader>ms", require("nvim-tree.api").marks.navigate.select)
--
-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

--luasnip
-- vim.cmd('')
--imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- vim.api.nvim_set_keymap("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<Cr>", {})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<Cr>", {})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<Cr>", {})
