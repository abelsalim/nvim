-- Opções Gerais
vim.g.mapleader = ' '
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.timeoutlen = 300
vim.opt.colorcolumn = "80,100,120"
vim.opt.list = true
vim.opt.scrolloff = 999
vim.opt.listchars = { space = '·', tab = '··', trail = '·', nbsp = '␣' }

-- Desabilitando Pyright
vim.g.disable_pyright = true

-- Indentação Padrão
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Configuração Específica por Linguagem (Lua e Python)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Auto-Open Nvim-Tree ao iniciar
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    require("nvim-tree.api").tree.open()
    vim.cmd("wincmd h")
  end
})

