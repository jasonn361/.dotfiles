return {
  's1n7ax/nvim-window-picker',
  version = 'v1.*',
  lazy = true,

  config = function()
    require('window-picker').setup({
      autoselect_one = true,
      include_current = false,
      filter_rules = {
        -- filter using buffer options
        bo = {
          -- if the file type is one of the following,
          -- the window will be ignored
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },

          -- if the buffer type is one of the following,
          -- the window will be ignored
          buftype = { 'terminal', 'quickfix' },
        },
      },
      other_win_hl_color = '#65bcff',
    })
  end
}
