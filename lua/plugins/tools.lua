return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "muniftanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("remote-nvim").setup({
        fs_copy_opts = {
          -- Aqui você coloca as pastas que ele deve ignorar
          exclude = { ".git", ".github", "node_modules" },
        },
      })
    end,
  }
}
