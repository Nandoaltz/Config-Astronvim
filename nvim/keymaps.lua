-- Mapeia atalhos para gerenciar sessões com persistence.nvim

-- Restaurar sessão atual
vim.keymap.set("n", "<leader>ss", require("persistence").load, { desc = "Restore Session" })

-- Restaurar última sessão
vim.keymap.set("n", "<leader>sl", function()
  require("persistence").load({ last = true })
end, { desc = "Restore Last Session" })

-- Não salvar a sessão atual
vim.keymap.set("n", "<leader>sd", require("persistence").stop, { desc = "Don't Save Current Session" })
