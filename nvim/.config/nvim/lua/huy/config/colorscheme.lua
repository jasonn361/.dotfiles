return {
  "folke/tokyonight.nvim",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("tokyonight").setup({

      -- theme style
      style = "night",

      -- enable bg transparency
      transparent = true,

      -- content styling
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "dark",
        floats = "dark",
      },

      -- etc
      hide_inactive_statusline = true,
      dim_inactive = true,
      lualine_bold = true,
    })
    -- load the colorscheme here
    vim.cmd([[ colorscheme tokyonight ]])
  end,
}
