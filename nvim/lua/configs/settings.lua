vim.opt.encoding = "utf-8"
vim.wo.number = true
vim.opt.mouse = "a"
vim.opt.wildmenu = true
vim.opt.confirm = true
vim.opt.incsearch = true
vim.opt.title = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.guicursor = ""
vim.opt.cursorline = true
vim.opt.termguicolors = true -- ativa cores verdadeiras
vim.cmd("syntax on")

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
