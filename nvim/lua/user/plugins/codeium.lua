return {
    "Exafunction/codeium.nvim",
    event = "InsertEnter",
    build = ":Codeium Auth",
    config = function()
      require("codeium").setup({})
    end,
  }
  