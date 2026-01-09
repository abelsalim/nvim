return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup({
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']c', function()
           if vim.wo.diff then return ']c' end
           vim.schedule(function() gs.next_hunk() end)
           return '<Ignore>'
        end, {expr=true, desc = "Próxima alteração"})

        map('n', '[c', function()
           if vim.wo.diff then return '[c' end
           vim.schedule(function() gs.prev_hunk() end)
           return '<Ignore>'
        end, {expr=true, desc = "Alteração anterior"})

        map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview alteração" })
        map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Git Blame" })
      end
    })
    
    -- Cores do Git (Poimandres customizado)
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#5de4c7", bold = true })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#fffac2", bold = true })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#f08784", bold = true })
  end
}

