-- Sair
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Sair (Quit)' })
vim.keymap.set('n', '<leader>Q', ':qa!<CR>', { desc = 'Sair Forçado de Tudo' })

-- Indentação no Visual Mode
vim.keymap.set('v', '>', '>gv', { desc = 'Indentar e manter seleção' })
vim.keymap.set('v', '<', '<gv', { desc = 'Recuar e manter seleção' })
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indentar com Tab' })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Recuar com Shift+Tab' })

-- Mover Linhas
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Mover linha para baixo' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Mover linha para cima' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Mover bloco para baixo' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Mover bloco para cima' })

-- Comandos Úteis
vim.keymap.set('n', '<leader>r', ':source $MYVIMRC<CR>', { desc = 'Recarregar Configurações' })
vim.keymap.set('n', '<leader>gs', '<Cmd>TermExec cmd="git status" direction=float<CR>', { desc = 'Status do Git' })
vim.keymap.set('n', '<leader>lx', vim.diagnostic.setloclist, { desc = "Listar erros (Quickfix)" })

-- Comentários
vim.keymap.set('n', '<leader>c', 'gcc', { remap = true, desc = "Comentar linha" })
vim.keymap.set('v', '<leader>c', 'gc', { remap = true, desc = "Comentar seleção" })

-- Navegação de Janelas (Ctrl + hjkl)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Janela da esquerda' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Janela de baixo' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Janela de cima' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Janela da direita' })

-- Copiar arquivo completo
vim.keymap.set('n', '<leader>ya', ':%y+<CR>', { desc = 'Copiar todo o arquivo' })

