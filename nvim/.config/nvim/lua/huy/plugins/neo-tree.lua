return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v2.x',

  config = function()
    --vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    require('neo-tree').setup({
      -- Source list
      sources = {
        'filesystem',
        'git_status',
      },

      add_blank_line_at_top = false, -- Add a blank line at the top of the tree.

      popup_border_style = 'rounded',   -- double, none, rounded, shadow, single, solid popup border

      -- Tab customization
      source_selector = {
        winbar = false,        -- show selector on top
        statusline = false,   -- show selector on bottom
        show_scrolled_of_parent_node = true,   -- replace tabs with parent
                                                -- with parent path when scrolled down
        -- Tab Icons
        tab_labels = {
          filesystem = ' Files',
          git_status = ' Git',
        },

        content_layout = 'start',
        tabs_layout = 'equal',
      },

      -- Events
      event_handlers = {
        -- {
        --   event = 'neo_tree_buffer_leave',
        --   handler = function(file_path)
        --     -- auto close
        --     vim.cmd 'Neotree toggle'
        --   end
        -- },
        {
          event = 'neo_tree_buffer_enter',
          handler = function()
            local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
            hl.blend = 100
            vim.api.nvim_set_hl(0, 'Cursor', hl)
            vim.opt.guicursor:append('a:Cursor/lCursor')
          end
        },
        {
          event = 'neo_tree_popup_buffer_enter',
          handler = function()
            local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
            hl.blend = 0
            vim.api.nvim_set_hl(0, 'Cursor', hl)
            vim.opt.guicursor:remove('a:Cursor/lCursor')
          end
        },
       {
          event = 'neo_tree_buffer_leave',
          handler = function()
            local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
            hl.blend = 0
            vim.api.nvim_set_hl(0, 'Cursor', hl)
            vim.opt.guicursor:remove('a:Cursor/lCursor')
          end
        }
      },

      -- File Explorer Symbols
      default_component_configs = {
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '',
          folder_empty_open = '',
        },

        -- Git Symbols
        git_status = {
          symbols = {
            -- Change type
            added = '✚',
            deleted = '󰩹',
            modified = '',
            renamed = '󰏫',

            -- Status type
            staged = '',
            unstaged = '✖',
            conflict = '',
            untracked = '',
          },
          align = 'left',
        },
      },

      -- Window settings
      window = {
        -- Custom mappings
        mappings = {
          ['<2-LeftMouse>'] = 'open_with_window_picker',
        },
      },

      filesystem = {
        filtered_items = {
          hide_gitignored = false,   -- do not hide gitignored files
        },
      },
    })
  end,
}
