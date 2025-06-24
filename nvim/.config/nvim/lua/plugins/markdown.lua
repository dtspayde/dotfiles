return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.nvim',
    },
    ft = { 'markdown', },
    opts = {
      preset = 'obsidian',
      completions = { blink = { enabled = true } },
    },
  },
  {
    'obsidian-nvim/obsidian.nvim',
    enabled = false,
    version = "*",
    -- lazy = true,
    ft = "markdown",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mini.nvim',
      'saghen/blink.cmp',
    },
    opts = {
      workspaces = {
        {
          name = 'work',
          path = '~/winhome/Documents/Vault',
        },
      },
      completion = {
        nvim_cmp = false,
        blink = true,
        min_chars = 2,
      },
      picker = {
        name = 'mini.pick',
      },
    },
  },
}
