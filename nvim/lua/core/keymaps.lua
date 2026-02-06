local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.g.have_nerd_font = true

-----------------------------------------------------------
-- GENERAL
-----------------------------------------------------------
keymap('n', '<C-_>', ':set number<CR>', opts) -- Toggle line numbers

-----------------------------------------------------------
-- TELESCOPE: Fuzzy Finder
-----------------------------------------------------------
keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
keymap('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', opts)

-----------------------------------------------------------
-- NVIM TREE: File Explorer
-----------------------------------------------------------
keymap('n', '\\', '<cmd>Neotree toggle<CR>', opts)
keymap('n', '<leader>e', '<cmd>Neotree focus<CR>', opts)
keymap('n', '<leader>f', '<C-w>l', opts)

-----------------------------------------------------------
-- LAZYGIT: Git UI
-----------------------------------------------------------
keymap('n', '<leader>gg', '<cmd>LazyGit<CR>', opts)

-----------------------------------------------------------
-- TOGGLETERM: Integrated Terminal
-----------------------------------------------------------
keymap('n', '<leader>tt', '<cmd>ToggleTerm<CR>', opts)

-----------------------------------------------------------
-- LAZY.NVIM: Plugin Manager
-----------------------------------------------------------
keymap('n', '<leader>ls', '<cmd>Lazy sync<CR>', opts)
keymap('n', '<leader>ll', '<cmd>Lazy<CR>', opts)


