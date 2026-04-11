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

      -- Mỗi service 1 terminal riêng, đặt đúng dir của service
      local services = {
        { key = "1", name = "user-service",    dir = "~/projects/user-service" },
        { key = "2", name = "order-service",   dir = "~/projects/order-service" },
        { key = "3", name = "product-service", dir = "~/projects/product-service" },
        { key = "4", name = "gateway",         dir = "~/projects/api-gateway" },
      }

      local terminals = {}

      for _, svc in ipairs(services) do
        terminals[svc.key] = Terminal:new({
          cmd = "cd " .. svc.dir .. " && ./mvnw spring-boot:run",
          direction = "horizontal",
          close_on_exit = false,
          display_name = svc.name,
        })

        -- <leader>s1 chạy service 1, <leader>s2 chạy service 2, ...
        vim.keymap.set("n", "<leader>s" .. svc.key, function()
          terminals[svc.key]:toggle()
        end, { desc = "Run " .. svc.name })
      end

      -- Chạy tất cả services cùng lúc
      vim.keymap.set("n", "<leader>sa", function()
        for _, t in pairs(terminals) do
          t:open()
        end
      end, { desc = "Run ALL services" })

      -- Stop tất cả
      vim.keymap.set("n", "<leader>sq", function()
        for _, t in pairs(terminals) do
          t:close()
        end
      end, { desc = "Stop ALL services" })

      -- Maven utils (chạy trong thư mục hiện tại)
      local maven_test = Terminal:new({ cmd = "./mvnw test",          direction = "horizontal", close_on_exit = false })
      local maven_clean = Terminal:new({ cmd = "./mvnw clean install", direction = "horizontal", close_on_exit = false })

      vim.keymap.set("n", "<leader>st", function() maven_test:toggle() end,  { desc = "Maven Test" })
      vim.keymap.set("n", "<leader>sc", function() maven_clean:toggle() end, { desc = "Maven Clean Install" })

      -- Thoát terminal mode
      vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    end,
  },
}
