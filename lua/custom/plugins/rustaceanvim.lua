return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false, -- rustaceanvim handles its own lazy-loading
    config = function()
      vim.g.rustaceanvim = {
        server = {
          standalone = true,
          on_attach = function(client, bufnr)
            vim.keymap.set('n', '<leader>ca', function()
              vim.cmd.RustLsp 'codeAction'
            end, { buffer = bufnr, desc = 'Rust Code Action', silent = true })
          end,
          default_settings = {
            ['rust-analyzer'] = {
              checkOnSave = true,
              cargo = {
                allFeatures = false,
              },
              files = {
                excludeDirs = { '.flatpak-builder', 'target', 'node_modules', 'dist' },
              },
              procMacro = {
                enable = true,
              },
              check = {
                command = 'check',
                allTargets = true,
              },
              diagnostics = {
                enable = true,
              },
              inlayHints = {
                typeHints = { enable = true },
                chainingHints = { enable = true },
                parameterHints = { enable = true },
              },
            },
          },
        },
      }
    end,
  },
}
