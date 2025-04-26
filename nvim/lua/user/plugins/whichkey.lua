return{
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {},
  keys = {
    {
      "<leader>z",
      function()
        vim.cmd("CopilotChat")
      end,
      desc = "Copilot",
    },
  },
}