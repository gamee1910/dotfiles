local map = vim.keymap.set

map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

map("n", "<C-q>", "<cmd>q<cr>", { desc = "Quit" })

map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yank" })

map("v", "p", [["_dP]], { desc = "Paste without losing clipboard" })

map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

map("n", "n", "nzzzv", { desc = "Next search (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search (centered)" })

map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })

map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "<leader>th", "<cmd>split | terminal<cr>", { desc = "Open terminal horizontal" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", { desc = "Open terminal vertical" })

map("n", "<leader>rn", vim.lsp.buf.rename, {})
