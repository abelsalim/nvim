return {
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Buscar Arquivos'})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Buscar Texto'})
      -- Adicionei o fz aqui também para o filtro interno
      vim.keymap.set('n', '<leader>fz', function() builtin.current_buffer_fuzzy_find() end, { desc = 'Filtro Interno'})

      require('telescope').setup({
        defaults = {
          preview = { treesitter = false }, -- Fix 0.11
        }
      })
    end
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "vim", "vimdoc", "python", "javascript", "c", "zig", "sql" },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- Sticky Scroll / Contexto
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    opts = {
      enable = true,
      max_lines = 5, -- Limita a 5 linhas para não poluir a tela
      trim_scope = 'outer',
    },
  },

  -- Utilitários
  { "windwp/nvim-autopairs", config = true },
  { "numToStr/Comment.nvim", config = true },
  
  -- Which-Key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { preset = "modern" },
    keys = {
      { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Ajuda Atalhos" },
    },
  },
}

