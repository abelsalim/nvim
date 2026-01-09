-- Fix para Neovim 0.11 (Deve ser a primeira coisa)
if vim.fn.has('nvim-0.11') == 1 then
  vim.treesitter.ft_to_lang = function(ft)
    return vim.treesitter.language.get_lang(ft) or ft
  end
end

local orig_notify = vim.notify

vim.notify = function(msg, level, opts)
  if type(msg) == "string" and msg:match("lspconfig") then
    return
  end
  orig_notify(msg, level, opts)
end

-- BLOQUEIA PYRIGHT GLOBALMENTE (Neovim 0.11+)
vim.lsp.config("pyright", {
  enabled = false,
})

-- Garante que pyright nunca será habilitado por filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    for _, client in pairs(vim.lsp.get_clients({ name = "pyright" })) do
      client.stop()
    end
  end,
})

-- Carrega Configurações Básicas e Atalhos
require("core.options")
require("core.keymaps")

-- [[ SETUP DO LAZY.NVIM ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Carrega os plugins da pasta lua/plugins/
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

