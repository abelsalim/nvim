return {
  -- Tema Poimandres
  {
    "olivercederborg/poimandres.nvim",
    priority = 1000,
    config = function()
      require('poimandres').setup({ disable_italics = false })
      vim.cmd.colorscheme("poimandres")
      vim.api.nvim_set_hl(0, "Whitespace", { fg = "#303340" })
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#232530" })
    end
  },

  -- Nvim-Tree (Explorador)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = { enable = true, update_root = true },
        view = { width = 30, side = "right" },
      })
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Abrir Explorador' })
    end,
  },

  -- Bufferline (Abas)
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          offsets = {{ filetype = "NvimTree", text = "Explorador", text_align = "center", separator = true }},
        }
      })
      vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
      vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>')
      vim.keymap.set('n', '<leader>x', ':bdelete<CR>')
    end,
  },

  -- Lualine (Barra de Status)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'poimandres',
          section_separators = { left = '', right = '' },
          component_separators = '',
          globalstatus = true,
        },
        sections = {
          lualine_a = { { 'mode', separator = { right = '' }, padding = { left = 1, right = 0 } } },
          lualine_b = { { 'filename', icon = '󰈚' }, { 'branch', icon = '' } },
          lualine_x = { 
            { function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                return next(clients) ~= nil and clients[1].name or 'No LSP'
              end, icon = ' LSP ~', color = { fg = '#ffffff', gui = 'bold' } } 
          },
        }
      })
    end
  },

  -- ToggleTerm (Terminal)
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<C-_>]],
        direction = 'float',
        float_opts = { border = 'curved' },
      })
    end
  },

  -- Indent Blankline
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "muniftanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  }
}

