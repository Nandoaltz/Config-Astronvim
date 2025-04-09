-- Define a tecla <leader> como espaço
vim.g.mapleader = " "

-- Função auxiliar para mapear teclas de forma silenciosa
local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

--(explorador de arquivos)
map("n", "<leader>e", "<CMD>Neotree toggle<CR>") 
map("n", "<leader>r", "<CMD>Neotree focus<CR>")   

-- Salvar arquivo
map("n", "<leader>w", "<CMD>update<CR>")         
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })
-- Fechar janela
map("n", "<leader>q", "<CMD>q<CR>")              

-- 🔚 Modo normal rápido (sai do modo inserção)
map("i", "jk", "<ESC>")                         

-- Abrir novas janelas 
map("n", "<leader>o", "<CMD>vsplit<CR>")          
map("n", "<leader>p", "<CMD>split<CR>")          

-- Navegação entre janelas
map("n", "<C-h>", "<C-w>h")                     
map("n", "<C-l>", "<C-w>l")                     
map("n", "<C-k>", "<C-w>k")                      
map("n", "<C-j>", "<C-w>j")                      

-- Redimensionamento de janelas
map("n", "<C-Left>",  "<C-w><")                   -- Diminui largura
map("n", "<C-Right>", "<C-w>>")                   -- Aumenta largura
map("n", "<C-Up>",    "<C-w>+")                   -- Aumenta altura
map("n", "<C-Down>",  "<C-w>-")                   -- Diminui altura
