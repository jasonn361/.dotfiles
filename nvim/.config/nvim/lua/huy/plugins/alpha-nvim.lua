return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  opts = function()
    local db = require('alpha.themes.dashboard')
    db.section.header.val = {
      '███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
      '████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
      '██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
      '██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
      '██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
      '╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    }

    db.section.buttons.val = {
      db.button('f', ' ' .. ' Find File', ':Telescope find_files<CR>'),
      db.button('n', ' ' .. ' New File', ':ene <BAR> startinsert<CR>'),
      db.button('r', 'ﮦ ' .. ' Recent Files', ':Telescope oldfiles<CR>'),
      db.button('p', ' ' .. ' Recent Projects', ':Telescope project<CR>'),
      db.button('g', ' ' .. ' Find Text', ':Telescope live_grep<CR>'),
      db.button('s', ' ' .. ' Restore Session', [[:lua require('persistence').load()<CR>]]),
      db.button('a', ' ' .. ' Plugins', ':e ~/.config/nvim/lua/huy/config/lazy.lua<CR>'),
      db.button('m', ' ' .. ' Mason', ':Mason<CR>'),
      db.button('l', ' ' .. ' Lazy', ':Lazy<CR>'),
      db.button('c', '' .. ' Configure', ':e ~/.config/nvim/lua/huy/config/options.lua<CR>'),
      db.button('h', ' ' .. 'Neovim Health', ':checkhealth<CR>'),
      db.button('q', ' ' .. ' Quit', ':qa!<CR>'),
    }
    for _, button in ipairs(db.section.buttons.val) do
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end
    db.section.header.opts.hl = 'AlphaHeader'
    db.section.buttons.opts.hl = 'AlphaButtons'
    db.section.footer.opts.lh = 'AlphaFooter'
    db.opts.layout[1].val = 15

    return db
  end,

  config = function(_, db)
    -- close lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show()
        end,
      })
    end
    require('alpha').setup(db.opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'AlphaReady',
      desc = 'hide cursor for alpha',
      callback = function()
        local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
        hl.blend = 100
        vim.api.nvim_set_hl(0, 'Cursor', hl)
        vim.opt.guicursor:append('a:Cursor/lCursor')
      end,
    })

    vim.api.nvim_create_autocmd('BufUnload', {
      buffer = 0,
      desc = 'show cursor after alpha',
      callback = function()
        local hl = vim.api.nvim_get_hl_by_name('Cursor', true)
        hl.blend = 0
        vim.api.nvim_set_hl(0, 'Cursor', hl)
        vim.opt.guicursor:remove('a:Cursor/lCursor')
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        db.section.footer.val = '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
