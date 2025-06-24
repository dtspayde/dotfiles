return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup(
        {
          ensure_installed = { 'python', 'bash', 'diff',
            'lua', 'luadoc', 'markdown', 'markdown_inline',
            'query', 'vim', 'vimdoc', 
          },
          auto_install = false,
          highlight = {
            enable = true,
            disable = { 'latex' },
          },
          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "gnn",
              node_incremental = "grn",
              scope_incremental = "grc",
              node_decremental = "grm",
            },
          },
          indent = { enable = true },
        }
      )
    end,
  },
  'nvim-treesitter/nvim-treesitter-context',
}
