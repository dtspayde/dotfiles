return {
  {
    'tpope/vim-sleuth',
    {
      'folke/which-key.nvim',
      event = 'VimEnter',
      opts = {
        delay = 0,
        spec = {
          { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
          { '<leader>d', group = '[D]ocument' },
          { '<leader>r', group = '[R]ename' },
          { '<leader>s', group = '[S]earch' },
          { '<leader>w', group = '[W]orkspace' },
          { '<leader>t', group = '[T]oggle' },
          { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
          { '\\', group = 'Toggle' },
        },
      },
    },
    {
      'stevearc/oil.nvim',
      opts = {
        view_options = { show_hidden = true },
        columns = { 'icon', 'permissions', 'size', 'mtime' },
        keymaps = {
          ['\\.'] = {
            'actions.toggle_hidden',
            desc = 'Toggle hidden files',
            mode = 'n'
          },
          ['\\f'] = {
            desc = 'Toggle floating window',
            mode = 'n',
            callback = function()
              require('oil').toggle_float()
            end,
          },
        },
      },
      dependencies = { { 'echasnovski/mini.nvim', opts = {} } },
      keys = { { '-', '<CMD>Oil<CR>', desc = 'Oil' } },
    },
  }
}

