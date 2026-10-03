return {
  {
    'mrcjkb/rustaceanvim',
    -- version = '^5',
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            vim.keymap.set('n', '<leader>ca', function()
              vim.cmd.RustLsp 'codeAction'
            end, { buffer = bufnr, desc = 'Rust Code Action', silent = true })
          end,
          default_settings = {
            ['rust-analyzer'] = {
              checkOnSave = true,
              ---- begin memory stuff
              cargo = {
                allFeatures = false, -- Only analyze the default features instead of everything
              },
              files = {
                -- Prevent analyzing build artifacts or non-Rust heavy directories
                excludeDirs = { '.flatpak-builder', 'target', 'node_modules', 'dist' },
              },
              procMacro = {
                enable = true, -- Set this to false ONLY if RAM is still an issue (you will lose some macro expansion features)
              },
              --- above is memory stuff
              check = {
                command = 'check', -- or 'clippy' for stricter lints
                allTargets = true,
              },
              diagnostics = {
                enable = true,
              },
              inlayHints = {
                typeHints = {
                  enable = true,
                },
                chainingHints = {
                  enable = true,
                },
                parameterHints = {
                  enable = true,
                },
              },
            },
          },
        },
      }
    end,
  },
}
--
-- {
--   {
--     'mrcjkb/rustaceanvim',
--     version = '^5', -- Recommended
--     lazy = false, -- rustaceanvim handles its own lazy-loading
--     config = function()
--       vim.g.rustaceanvim = {
--         server = {
--           default_settings = {
--             ['rust-analyzer'] = {
--               inlayHints = {
--                 bindingModeHints = { enable = false },
--                 chainingHints = { enable = true },
--                 closingBraceHints = { enable = true, minLines = 25 },
--                 closureReturnTypeHints = { enable = 'never' },
--                 lifetimeElisionHints = { enable = 'never', useParameterNames = false },
--                 maximumTypeHintsLength = 25,
--                 parameterHints = { enable = true },
--                 reborrowHints = { enable = 'never' },
--                 renderColons = true,
--                 typeHints = {
--                   enable = true,
--                   hideClosureInitialization = false,
--                   hideNamedConstructor = false,
--                 },
--               },
--             },
--           },
--         },
--       }
--     end,
--   },
-- },
--
