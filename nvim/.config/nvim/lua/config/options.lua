local opt = vim.opt

-- Editor
opt.relativenumber = true -- số dòng tương đối (rất hữu ích với vim motions)
opt.number = true -- hiện số dòng hiện tại
opt.cursorline = true -- highlight dòng hiện tại
opt.scrolloff = 8 -- giữ 8 dòng khi scroll
opt.sidescrolloff = 8
opt.wrap = false -- không wrap dòng dài
-- opt.colorcolumn = "120"         -- line guide ở cột 120

-- Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- dùng spaces thay tab
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true -- tìm kiếm không phân biệt hoa thường
opt.smartcase = true -- trừ khi gõ chữ hoa
opt.hlsearch = false -- không highlight sau khi tìm xong
opt.incsearch = true -- highlight khi đang gõ

-- Performance
opt.updatetime = 100
opt.timeoutlen = 300

-- UI
opt.termguicolors = true
opt.signcolumn = "yes" -- luôn hiện cột sign (LSP icons)
opt.splitbelow = true -- split xuống dưới
opt.splitright = true -- split sang phải

-- Clipboard
opt.clipboard = "unnamedplus" -- sync với system clipboard

-- Backup
opt.swapfile = false
opt.backup = false
opt.undofile = true -- persistent undo
