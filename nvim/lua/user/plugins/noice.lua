return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      signature = { enabled = false },
      hover = { enabled = false },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          find = "deprecated",
        },
        opts = { skip = true },
      },
    },
  },
}
