local retcolors = {}
local colorschemes = {
  'folke/tokyonight.nvim',
  'sainnhe/sonokai',
  'sainnhe/everforest',
  'sainnhe/gruvbox-material',
  'sainnhe/edge',
  'sainnhe/edge-light',
  'olimorris/onedarkpro.nvim',
}

for i = 1, #colorschemes, 1
do
  table.insert(retcolors, {
    colorschemes[i],
    priority = 1000,
  })
end

return retcolors
