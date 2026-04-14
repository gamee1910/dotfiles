return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-`>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle terminal" },
    },
    config = function()
      require("toggleterm").setup({
        size = 15,
        direction = "horizontal",
        shade_terminals = true,
        close_on_exit = false,
      })

      local Terminal = require("toggleterm.terminal").Terminal

      -- Maven utils (chạy trong thư mục hiện tại)
      local maven_test = Terminal:new({ cmd = "./mvnw test", direction = "horizontal", close_on_exit = false })
      local maven_clean =
        Terminal:new({ cmd = "./mvnw clean install", direction = "horizontal", close_on_exit = false })

      vim.keymap.set("n", "<leader>st", function()
        maven_test:toggle()
      end, { desc = "Maven Test" })
      vim.keymap.set("n", "<leader>sc", function()
        maven_clean:toggle()
      end, { desc = "Maven Clean Install" })

      -- Thoát terminal mode
      vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    end,
  },
}
