-- keymaps.lua

vim.keymap.set("n", "<leader>qs", require("persistence").load, { desc = "Restore Session" })
vim.keymap.set("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end, { desc = "Restore Last Session" })
vim.keymap.set("n", "<leader>qd", require("persistence").stop, { desc = "Don't Save Current Session" })
