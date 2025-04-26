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
          find = "deprecated"
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "written"
        },
        opts = {skip = true},
      },
    },
    views = {
      cmdline_popup = {
        position = {
          row = "95%", -- vertical
          col = "95%", -- horizontal
        },
        size = {
          width = 50,
          height = 1,
        },
      },
      popupmenu = {
        position = {
          row = "100%",
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    }
  }
}  
