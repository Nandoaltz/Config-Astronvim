return{
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {},
  keys = {
    {
      "<leader>z",
      function()
      end,
      desc = "Ollama",
    },
    {
      "<leader>zx",
      function()
        vim.cmd("Gen Change_Code")
      end,
      desc = "Change_Code",
    },
    {
      "<leader>za",
      function()
        vim.cmd("Gen Chat")
      end,
      desc = "Chat",
    },
  },
}