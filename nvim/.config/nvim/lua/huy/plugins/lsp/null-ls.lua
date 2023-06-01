return {
  "jose-elias-alvarez/null-ls.nvim",

  config = function()
    -- for conciseness
    local formatting = require("null-ls").builtins.formatting -- to setup formatters
    local diagnostics = require("null-ls").builtins.diagnostics -- to setup linters

    -- to setup format on save
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- configure null_ls
    require("null-ls").setup({
      -- setup formatters & linters
      sources = {
        --  to disable file types use
        --  "formatting.prettier.with({disabled_filetypes = {}})" (see null-ls docs)
        formatting.clang_format, -- c/cpp formatter
        formatting.cmake_format, -- cmake formatter/linter
        formatting.rubocop, -- ruby formatter/linter
        formatting.htmlbeautifier, -- html formatter
        formatting.latexindent, -- latex formatter
        formatting.cbfmt, -- markdown formatter
        formatting.prettier, -- js/ts formatter
        formatting.stylua, -- lua formatter
        diagnostics.cpplint, -- c/cpp linter
        diagnostics.erblint, -- html/ruby linter
        diagnostics.vale, -- markdown/latex linter
        diagnostics.eslint_d.with({ -- js/ts linter
          -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
          condition = function(utils)
            return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
          end,
        }),
      },
      -- configure format on save
      on_attach = function(current_client, bufnr)
        if current_client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                filter = function(client)
                  --  only use null-ls for formatting instead of lsp server
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              })
            end,
          })
        end
      end,
    })
  end,
}
