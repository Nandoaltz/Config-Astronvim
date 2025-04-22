-- Define a tecla <leader> como espaço
-- ⚠️ Isso precisa estar antes de qualquer require('lazy')!
vim.g.mapleader = " "

-- Função auxiliar para mapear teclas de forma silenciosa
local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- 📁 NeoTree (explorador de arquivos)
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")  -- Abre/fecha o NeoTree
map("n", "<leader>r", "<CMD>Neotree focus<CR>")   -- Foca no NeoTree

-- 💾 Salvar arquivo
map("n", "<leader>w", "<CMD>update<CR>")          -- Salva arquivo se houver mudanças
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true }) -- Ctrl+S para salvar
-- ❌ Fechar janela
map("n", "<leader>q", "<CMD>q<CR>")               -- Fecha a janela atual

-- 🔚 Modo normal rápido (sai do modo inserção)
map("i", "jk", "<ESC>")                           -- "jk" no modo de inserção vira ESC

-- 🪟 Abrir novas janelas (splits)
map("n", "<leader>o", "<CMD>vsplit<CR>")          -- Divide verticalmente
map("n", "<leader>p", "<CMD>split<CR>")           -- Divide horizontalmente

-- 🔀 Navegação entre janelas
map("n", "<C-h>", "<C-w>h")                       -- Move para janela da esquerda
map("n", "<C-l>", "<C-w>l")                       -- Move para a direita
map("n", "<C-k>", "<C-w>k")                       -- Move para cima
map("n", "<C-j>", "<C-w>j")                       -- Move para baixo

-- 📏 Redimensionamento de janelas
map("n", "<C-Left>",  "<C-w><")                   -- Diminui largura
map("n", "<C-Right>", "<C-w>>")                   -- Aumenta largura
map("n", "<C-Up>",    "<C-w>+")                   -- Aumenta altura
map("n", "<C-Down>",  "<C-w>-")                   -- Diminui altura
