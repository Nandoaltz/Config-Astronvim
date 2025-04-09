vim.cmd([[ map q :q<CR> ]])

-- Para Salvar com 'Ctrl + S' nos modos: Normal, Inserção e Visual
-- Precisa adicionar a linha: stty -ixon , ao seu ~/.bashrc
vim.cmd([[ nnoremap <C-s> :w<CR> ]])
vim.cmd([[ inoremap <C-s> <Esc>:w<CR>l ]])
vim.cmd([[ vnoremap <C-s> <Esc>:w<CR> ]])

-- Selecionar tudo com 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- BASH - Auto preenche arquivos .sh que não existirem com a SheBang
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

-- Se não existir o arquivo C++ de extensão .cpp ele preenche da forma abaixo
-- altere para sua(s) linguagens preferidas
vim.cmd([[
	function! AutoCpp()
	  call append(0, '#include <iostream>')
	  call append(1, '')
	  call append(2, 'int main( int argc , char **argv ){')
	  call append(3, "  std::cout << \"Olá, Mundo!\" << '\\n';")
	  call append(4, '  return 0;')
	  call append(5, '}')
	  call cursor(4, 17)
	endfunction
	autocmd BufNewFile *.cpp :call AutoCpp()
]])

vim.cmd([[ nnoremap <C-n> :NvimTreeOpen<CR> ]])
vim.cmd([[ inoremap <C-n> <Esc>:NvimTreeOpen<CR>l ]])
vim.cmd([[ vnoremap <C-n> <Esc>:NvimTreeOpen<CR> ]])

vim.cmd([[ nnoremap <C-h> :ToggleTerm direction=horizontal<CR> ]])
vim.cmd([[ inoremap <C-h> <Esc>:ToggleTerm direction=horizontal<CR> ]])
vim.cmd([[ vnoremap <C-h> <Esc>:ToggleTerm direction=horizontal<CR> ]])

-- Terminal vertical (Ctrl + v)
vim.cmd([[ nnoremap <C-v> :ToggleTerm direction=vertical<CR> ]])
vim.cmd([[ inoremap <C-v> <Esc>:ToggleTerm direction=vertical<CR> ]])
vim.cmd([[ vnoremap <C-v> <Esc>:ToggleTerm direction=vertical<CR> ]])

-- Terminal flutuante (Ctrl + t)
vim.cmd([[ nnoremap <C-t> :ToggleTerm direction=float<CR> ]])
vim.cmd([[ inoremap <C-t> <Esc>:ToggleTerm direction=float<CR> ]])
vim.cmd([[ vnoremap <C-t> <Esc>:ToggleTerm direction=float<CR> ]])

local opts = { silent = true }

-- Fechar com 'q'
vim.keymap.set("n", "q", ":q<CR>", opts)

-- Salvar com Ctrl + S
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>l", opts)
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>", opts)

-- Selecionar tudo com Ctrl + A
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- Abrir NvimTree com Ctrl + N
vim.keymap.set("n", "<C-n>", ":NvimTreeOpen<CR>", opts)
vim.keymap.set("i", "<C-n>", "<Esc>:NvimTreeOpen<CR>l", opts)
vim.keymap.set("v", "<C-n>", "<Esc>:NvimTreeOpen<CR>", opts)

-- Terminal Horizontal (Ctrl + H)
vim.keymap.set("n", "<C-h>", ":ToggleTerm direction=horizontal<CR>", opts)
vim.keymap.set("i", "<C-h>", "<Esc>:ToggleTerm direction=horizontal<CR>", opts)
vim.keymap.set("v", "<C-h>", "<Esc>:ToggleTerm direction=horizontal<CR>", opts)

-- Terminal Vertical (Ctrl + V)
vim.keymap.set("n", "<C-v>", ":ToggleTerm direction=vertical<CR>", opts)
vim.keymap.set("i", "<C-v>", "<Esc>:ToggleTerm direction=vertical<CR>", opts)
vim.keymap.set("v", "<C-v>", "<Esc>:ToggleTerm direction=vertical<CR>", opts)

-- Terminal Flutuante (Ctrl + T)
vim.keymap.set("n", "<C-t>", ":ToggleTerm direction=float<CR>", opts)
vim.keymap.set("i", "<C-t>", "<Esc>:ToggleTerm direction=float<CR>", opts)
vim.keymap.set("v", "<C-t>", "<Esc>:ToggleTerm direction=float<CR>", opts)
