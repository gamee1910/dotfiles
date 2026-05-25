local colorScheme = {
  { "xero/miasma.nvim", name = "miasma" },
  { "olivercederborg/poimandres.nvim", name = "poimandres" },
  { "folke/tokyonight.nvim", name = "tokyonight" },
  { "catppuccin/nvim", name = "catppuccin" },
}

local currentIndex = 1

local function cycleColorScheme()
  local pick = colorScheme[currentIndex]
  local ok, err = pcall(vim.cmd, "colorscheme " .. pick.name)
  if ok then
    vim.notify("Colorscheme: " .. pick.name, vim.log.levels.INFO)
  else
    vim.notify("Failed: " .. pick.name .. " — " .. err, vim.log.levels.WARN)
  end
  currentIndex = (currentIndex % #colorScheme) + 1
end

vim.keymap.set("n", "<leader>qp", cycleColorScheme, { desc = "Cycle colorscheme" })

return {
  { "xero/miasma.nvim" },
  { "olivercederborg/poimandres.nvim" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim" },
}
