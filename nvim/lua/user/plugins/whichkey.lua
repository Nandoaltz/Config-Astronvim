return{
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {},
  keys = {
    {
      "<leader>z",
      function()
        vim.cmd("Gen Chat")
      end,
      desc = "Ollama",
    },
  },
}