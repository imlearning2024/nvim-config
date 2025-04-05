local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
map('n', "<leader>t" ,":terminal<CR>" ,opts);
map('n', '<C-n>', ':nohlsearch<CR>', opts)
map('i', '<C-H>', '<C-W>', opts)
map('i', '<C-BS>', '<C-W>', opts)
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bd<CR>", opts)
map("n", "<leader>bD", ":%bd|e#|bd#<CR>", opts)
map("n", "<leader>bb", ":Telescope buffers<CR>", opts)
--mouse on
vim.o.mouse = "a"

---tab keybind
-- Ctrl-t + n → New tab
vim.keymap.set("n", "<C-t>n", ":tabnew<CR>", { desc = "New Tab", noremap = true, silent = true })

-- Ctrl-t + c → Close tab
vim.keymap.set("n", "<C-t>c", ":tabclose<CR>", { desc = "Close Tab", noremap = true, silent = true })

-- Ctrl-t + l → Next tab
vim.keymap.set("n", "<C-t>l", ":tabnext<CR>", { desc = "Next Tab", noremap = true, silent = true })

-- Ctrl-t + h → Previous tab
vim.keymap.set("n", "<C-t>h", ":tabprev<CR>", { desc = "Previous Tab", noremap = true, silent = true })

