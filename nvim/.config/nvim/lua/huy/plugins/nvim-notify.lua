return {
  "rcarriga/nvim-notify",
  lazy = true,

  keys = {
    {
      "<leader>un",
      function()
        require("notify").dimiss({
          silent = true,
          pending = true,
        })
      end,
      desc = "Delete all notifications",
    },
  },
  opts = {
    background_colour = "#000000",
    timeout = 1000,
    max_height = function()
      return math.floor(vim.o.lines * 0.25)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.25)
    end,
  },
  init = function()
    -- when noice is not enabled, install notify on VeryLazy
    local Util = require("huy.util")
    if not Util.has("noice.nvim") then
      Util.on_very_lazy(function()
        vim.notify = require("notify")
      end)
    end
  end,
}
