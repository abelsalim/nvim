return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPre", -- Carrega apenas quando abrir um arquivo
  config = function()
    require("treesitter-context").setup({
      enable = true, -- Ativa o plugin
      max_lines = 3, -- Limite de linhas (ex: nome da classe + nome da função)
      trim_scope = 'outer', -- Corta o contexto externo se for muito longo
      min_window_height = 0, -- Altura mínima da janela para ativar
      patterns = { -- Configurações específicas para linguagens
        default = {
          'class',
          'def',
          'function',
          'method',
          'for',
          'while',
          'if',
          'switch',
          'case',
        },
      },
      zindex = 20, -- Garante que fique acima do texto normal
      mode = 'cursor', -- 'cursor' (acompanha onde vc está) ou 'topline'
      separator = nil, -- Pode colocar um separador visual se quiser (ex: "-")
    })
  end,
}
