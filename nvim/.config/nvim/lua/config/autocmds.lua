local autocmd = vim.api.nvim_create_autocmd

-- Highlight khi yank
autocmd("TextYankPost", {
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
  end,
})

-- Tự động format khi save (dùng LSP)
autocmd("BufWritePre", {
  desc = "Auto format on save",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Tắt auto comment khi xuống dòng mới
autocmd("BufEnter", {
  desc = "Disable auto comment on new line",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Nhớ vị trí cursor khi mở lại file
autocmd("BufReadPost", {
  desc = "Restore cursor position",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Tự động resize windows khi terminal thay đổi kích thước
autocmd("VimResized", {
  desc = "Resize windows on terminal resize",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- C++: tự động tạo input.txt nếu chưa có
autocmd("BufNewFile", {
  pattern = "*.cpp",
  desc = "Create input.txt for C++",
  callback = function()
    local dir = vim.fn.expand("%:p:h")
    local input = dir .. "/input.txt"
    if vim.fn.filereadable(input) == 0 then
      vim.fn.writefile({}, input)
    end
  end,
})
