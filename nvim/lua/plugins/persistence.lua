return {
    "folke/persistence.nvim",
    event = "BufReadPre", 
    opts = {
      dir = vim.fn.stdpath("state") .. "/sessions/",
      options = { "buffers", "curdir", "tabpages", "winsize" },
    },
  }
  
