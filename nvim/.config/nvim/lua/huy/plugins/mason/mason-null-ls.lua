return {
  'jayp0521/mason-null-ls.nvim',

  config = function()
    require('mason-null-ls').setup({
      -- list of formatters & linters for mason to install
      ensure_installed = {
        'prettier',    -- ts/js formatter
        'sylua',       -- lua formatter
        'eslint_d',    -- ts/js linter
      },
      -- auto-install configured formatters & linters (with null-ls)
      automatic_installation = true,
    })
  end,
}
