return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  config = function()
      require("nvim-surround").setup({
          -- Defaults are usually enough
      })
  end
}

