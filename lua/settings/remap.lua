vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>fa", ":Files<CR>")
vim.keymap.set("n", "<leader>f", ":GitFiles<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>dq", ":q!<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")

vim.keymap.set("n", "<leader>tr", ":NERDTreeToggle<CR>")

-- map leader nt to open new tabs
vim.keymap.set("n", "<leader>nt", ":tabnew<CR>")
--map option shift right or left to go to next tabs
--vim.keymap.set("n", "<M-S-Right>", ":tabnext<CR>")
vim.keymap.set("n", "<M-S-Left>", ":tabprevious<CR>")
vim.keymap.set("n", "<M-S-Right>", ":tabnext<CR>")
--set this map for terminal modes
vim.keymap.set("n", "<leader>ct", ":q<CR>")
-- map leader nw to open new window and nW to open new vertical window
vim.keymap.set("n", "<leader>nw", ":vs<CR>")
vim.keymap.set("n", "<leader>nW", ":sp<CR>")
vim.keymap.set("n", "<leader>cw", ":bd<CR>")
----map option n to swicth to window n
vim.keymap.set("n", "<M-n>", ":<C-u>tabn<Space>")

-- map option shift f to format the code
-- vim.keymap.set("n", "<M-S-f>", ":Format<CR>")
--
-- map esc to close the terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<M-S-Left>", "<C-\\><C-N>:tabprevious<CR>")
