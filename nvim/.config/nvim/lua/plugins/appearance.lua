return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'kanagawa'
    end,
  },
  'catppuccin/nvim',
  'folke/tokyonight.nvim',
  'navarasu/onedark.nvim',
  'sainnhe/gruvbox-material',
  'scottmckendry/cyberdream.nvim',
  { 'echasnovski/mini.nvim',
    config = function()

      -- Icon provider
      require('mini.icons').setup()

      -- Statusline
      require('mini.statusline').setup()
      require('mini.statusline').section_location = function()
        return '%2l:%-2v'
      end

      -- Tabline
      require('mini.tabline').setup()

      -- Window event animations
      require('mini.animate').setup()

      -- Improved gutter utilities
      require('mini.git').setup()
      require('mini.diff').setup()

      -- Text pattern highlighting
      require('mini.hipatterns').setup({
        highlighters = {
          fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
          hack  = { pattern = 'HACK',  group = 'MiniHipatternsHack'  },
          todo  = { pattern = 'TODO',  group = 'MiniHipatternsTodo'  },
          note  = { pattern = 'NOTE',  group = 'MiniHipatternsNote'  },
          whitespace = { pattern = '%f[%s]%s*$', group = 'Error' },
        }
      })

      -- Improved notifications
      require('mini.notify').setup({
        lsp_progress = { enable = true }
      })
      vim.notify = require('mini.notify').make_notify()

      -- Better defaults, mappings, and autocommands
      require('mini.basics').setup {
        options = {
          basics = true,
          extra_ui = true,
        },
        mappings = {
          windows = true,
          move_with_alt = true,
        },
        autocommands = {
          relnum_in_visual_mode = true,
        },
      }

      -- Extras
      require('mini.extra').setup()

      -- Better around/inside textobjects
      local gen_ai_spec = require('mini.extra').gen_ai_spec
      require('mini.ai').setup({
        n_lines = 500,
        custom_textobjects = {
          B = gen_ai_spec.buffer(),
          D = gen_ai_spec.diagnostic(),
          I = gen_ai_spec.indent(),
          L = gen_ai_spec.line(),
          N = gen_ai_spec.number(),
        },
      })

      -- Add/delete/replace surroundings
      require('mini.surround').setup()

      -- Remove buffers cleanly
      require('mini.bufremove').setup()

      -- Easier commenting
      require('mini.comment').setup()

      -- Automatically add bracket pairs
      require('mini.pairs').setup()

      -- Enhanced square bracket navigation
      require('mini.bracketed').setup()

      -- Picker
      -- require('mini.pick').setup()
      require('mini.pick').setup({
        window = {
          config = {
            border = 'double',
            -- relative = 'cursor', anchor = 'NW',
            -- row = 0, col = 0, width = 40, height = 20,
          },
        },
      })

      local map = function(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { desc = desc })
      end

      map('<leader>sh', function() MiniPick.builtin.help() end, '[S]earch [H]elp')
      map('<leader>sk', function() MiniExtra.pickers.keymaps() end, '[S]earch [K]eymaps')
      map('<leader>sf', function() MiniPick.builtin.files() end, '[S]earch [F]iles')
      map('<leader>sw', function() MiniPick.builtin.grep() end, '[S]earch by [W]ord')
      map('<leader>sg', function() MiniPick.builtin.grep_live() end, '[S]earch by [G]rep')
      map('<leader>sd', function() MiniExtra.pickers.diagnostic() end, '[S]earch [D]iagnostics')
      map('<leader>sr', function() MiniPick.builtin.resume() end, '[S]earch [R]esume')
      map('<leader><leader>', function() MiniPick.builtin.buffers() end, '[ ] Find existing buffers')
      map('<leader>sc', function() MiniExtra.pickers.commands() end, '[S]earch [C]ommands')
      map('<leader>se', function() MiniExtra.pickers.explorer() end, '[S]earch Files by [E]xplorer')
      map('<leader>s.', function() MiniExtra.pickers.oldfiles() end, '[S]earch Recent Files')

    end,
  },
}
