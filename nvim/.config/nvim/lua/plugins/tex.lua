return {
  {
    'lervag/vimtex',
    lazy = false,
    init = function()
      vim.g.vimtex_fold_enabled = 1
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_complete_close_braces = 1
      vim.g.vimtex_quickfix_autoclose_after_keystrokes = 5
    end,
  },
}
