return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      })

      telescope.load_extension("fzf")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Tìm file" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Tìm chữ trong file (grep)" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Danh sách buffer" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Tìm trợ giúp" })
      vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Tìm từ dưới con trỏ" })
    end,
  },
}
