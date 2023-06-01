return {
  "nvim-telescope/telescope.nvim",
  version = "*",

  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<CR>"] = actions.select_default,
            ["<C-q>"] = actions.close,
          },
          n = {
            ["<C-q>"] = actions.close,
          },
        },
      },
      pickers = {
        buffers = {
          initial_mode = "normal",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("project")
    require("telescope").load_extension("notify")
    require("telescope").load_extension("undo")
  end,
}
