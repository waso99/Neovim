
-- return {
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
--   {
--     "catppuccin",
--     opts = {
--       transparent_background = true,
--     },
--   },
-- }

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
  {
    "sainnhe/gruvbox-material",
    init = function()
      vim.g.gruvbox_material_background = "hard" -- soft | medium | hard
      vim.g.gruvbox_material_transparent_background = 1
    end,
  },
}

