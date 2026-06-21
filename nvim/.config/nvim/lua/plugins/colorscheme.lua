local currentIndex = 1

local colorSchemes = {
  { name = "tokyonight" },
  { name = "catppuccin-frappe" },
  { name = "everforest" },
  { name = "onedark" },
  { name = "gruvbox-material" },
  { name = "vscode" },
}

local function cycleColorScheme()
  local pick = colorSchemes[currentIndex]
  local ok, err = pcall(vim.cmd, "colorscheme " .. pick.name)
  if ok then
    vim.notify("Colorscheme: " .. pick.name, vim.log.levels.INFO)
  else
    vim.notify("Failed: " .. pick.name .. " — " .. err, vim.log.levels.WARN)
  end
  currentIndex = (currentIndex % #colorSchemes) + 1
end

vim.keymap.set("n", "<leader>qp", cycleColorScheme, { desc = "Cycle colorscheme" })

return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({ style = "darker" })
    end,
  },
  { "folke/tokyonight.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({ flavour = "macchiato" })
    end,
  },
  { "neanias/everforest-nvim" },
  {
    "sainnhe/gruvbox-material",
  },
  {
    "Mofiqul/vscode.nvim",
    config = function()
      require("vscode").setup({
        style = "dark",
      })
    end,
  },
}
