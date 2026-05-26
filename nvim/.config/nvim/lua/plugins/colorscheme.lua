local currentIndex = 1

local colorSchemes = {
  { name = "tokyonight" },
  { name = "catppuccin-frappe" },
  { name = "everforest" },
  { name = "onedark" },
  { name = "gruvbox-material" },
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
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({ style = "darker" })
      require("onedark").load()
    end,
  },
  {
    "sainnhe/gruvbox-material",
  },
}
