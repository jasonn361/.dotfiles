return {
  'hrsh7th/nvim-cmp',

  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    require('luasnip/loaders/from_vscode').lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(),   -- prev suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(),   -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),       -- show completeiong suggestions
        ['<C-e>'] = cmp.mapping.abort(),              -- clos completetion window
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = 'copilot' },   -- copilot
        { name = 'nvim_lsp' },  -- lsp
        { name = 'luasnip' },   -- snippets
        { name = 'buffer' },    -- text within buffer
        { name = 'path' },      -- file system path
      }),
      -- config lspkind for vs-code like icons
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = '...',
        }),
      },
    })
  end
 }
