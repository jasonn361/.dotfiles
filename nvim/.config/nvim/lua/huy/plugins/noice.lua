return {
  'folke/noice.nvim',

  config = function()
    require('noice').setup({
      ensure_installed = 'on_file_open',
      lsp = {
        -- override markdown rendering so that **cmp** and other
        -- plugins use **Treesitter
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        -- Enable preset for easier config
        preset = {
          bottom_search = true,           -- use classic bottom cmdline search
          command_palette = true,         -- position the cmdline and popmenu together
          long_message_to_split = true,   -- long messages will be sent to a split
        },
      },
    })
  end
}
