if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  -- sources = {
  --   null_ls.builtins.formatting.prettierd,
  --   null_ls.builtins.diagnostics.eslint_d.with({
  --     diagnostics_format = '[eslint] #{m}\n(#{c})'
  --   }),
  --   null_ls.builtins.diagnostics.fish
  -- },
  sources = {
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish,
    require('null-ls').builtins.code_actions.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.code_actions.gitsigns,
    require('null-ls').builtins.code_actions.proselint,
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.diagnostics.proselint,
    require('null-ls').builtins.diagnostics.gitlint,
    require('null-ls').builtins.diagnostics.luacheck.with({
      extra_args = { '--config', vim.fn.stdpath('config') .. '/.luacheckrc' },
    }),
    -- require("null-ls").builtins.diagnostics.phpstan,
    require('null-ls').builtins.diagnostics.solhint,
    require('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.prettierd,
    require('null-ls').builtins.formatting.phpcsfixer,
    require('null-ls').builtins.formatting.jq,
    require('null-ls').builtins.formatting.rustywind,
    require('null-ls').builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
