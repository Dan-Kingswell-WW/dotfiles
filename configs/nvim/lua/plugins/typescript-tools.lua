return {
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}

      for _, ft in ipairs({ 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }) do
        opts.formatters_by_ft[ft] = { 'prettier' }
      end
    end,
  },
  {
    'neovim/nvim-lspconfig',
    optional = true,
    opts = {
      servers = {
        eslint = {
          settings = {
            workingDirectories = { mode = 'auto' },
            format = true,
          },
        },
      },
    },
  },
}
