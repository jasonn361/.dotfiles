return {
  'petertriho/nvim-scrollbar',

  config = function()
    require('scrollbar').setup({
      excluded_buftypes = {
        'neo-tree'
      }
    })
  end
}
