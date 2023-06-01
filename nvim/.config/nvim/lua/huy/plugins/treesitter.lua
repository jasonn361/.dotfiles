return {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    local ts_update = require('nvim-treesitter.install').update({
      with_sync = true
    })
  end,
  lazy = true,

  config = function()
    require('nvim-treesitter.configs').setup({
      -- List of parser names, or "all" (the five list parsers should always be installed)
      ensure_installed = {
        'c',
        'cpp',
        'cmake',
        'make',
        'markdown',
        'markdown_inline',
        'lua',
        'vim',
        'help',
        'query',
        'html',
        'http',
        'css',
        'javascript',
        'json',
        'typescript',
        'python',
        'yaml',
        'rust',
        'regex',
        'bash',
        'latex',
      },

      playground = {
        enable = true,
      },
      -- Install parsers synchronously (only applied to 'ensure_installed')
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        -- False will disable the whole plugin
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = { 'markdown' },
      },
    })
  end
}
