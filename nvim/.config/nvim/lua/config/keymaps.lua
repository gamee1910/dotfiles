local map = vim.keymap.set

-- ══════════════════════════════════════
-- General
-- ══════════════════════════════════════

-- Lưu file
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save file" })

-- Thoát
map("n", "<C-q>", "<cmd>q<cr>", { desc = "Quit" })

-- Xóa mà không copy vào clipboard
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yank" })

-- Paste mà không mất clipboard
map("v", "p", [["_dP]], { desc = "Paste without losing clipboard" })

-- ══════════════════════════════════════
-- Navigation
-- ══════════════════════════════════════

-- Di chuyển giữa windows bằng Ctrl+hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Di chuyển dòng lên/xuống trong visual mode
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move line up" })

-- Giữ cursor ở giữa khi scroll
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- Giữ cursor ở giữa khi tìm kiếm
map("n", "n", "nzzzv", { desc = "Next search (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search (centered)" })

-- ══════════════════════════════════════
-- Buffers
-- ══════════════════════════════════════
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- ══════════════════════════════════════
-- C++ Competitive Programming
-- ══════════════════════════════════════
map("n", "<leader>rr", function()
  local file = vim.fn.expand("%:p")
  local out  = vim.fn.expand("%:p:r")
  local cmd  = string.format("g++ -std=c++17 -O2 -o %s %s && %s", out, file, out)
  vim.cmd("split | terminal " .. cmd)
end, { desc = "Compile & Run C++" })

map("n", "<leader>ri", function()
  local file = vim.fn.expand("%:p")
  local out  = vim.fn.expand("%:p:r")
  local dir  = vim.fn.expand("%:p:h")
  local cmd  = string.format("g++ -std=c++17 -O2 -o %s %s && %s < %s/input.txt", out, file, out, dir)
  vim.cmd("split | terminal " .. cmd)
end, { desc = "Compile & Run C++ with input.txt" })

-- ══════════════════════════════════════
-- Terminal
-- ══════════════════════════════════════
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- ══════════════════════════════════════
-- Misc
-- ══════════════════════════════════════

-- Thay thế word dưới cursor toàn file
map("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- Thoát terminal mode
map("n", "<leader>th", "<cmd>split | terminal<cr>", { desc = "Open terminal horizontal" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", { desc = "Open terminal vertical" })
