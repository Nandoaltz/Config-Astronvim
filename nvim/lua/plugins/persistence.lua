return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- ou "VeryLazy"
  opts = {
    dir = vim.fn.stdpath("state") .. "/sessions/",
    options = { "buffers", "curdir", "tabpages", "winsize" },
  },
}
