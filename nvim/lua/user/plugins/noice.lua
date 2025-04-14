return
{
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      cmdline = {
        view = "cmdline", -- ou "none" para ocultar
        format = {
          cmdline = { icon = "", conceal = false },
          search_down = { icon = " ", conceal = false },
          search_up = { icon = " ", conceal = false },
        },
      },
      messages = {
        enabled = true,
        view = "mini", -- ou "none"
        view_error = "mini",
        view_warn = "mini",
      },
      notify = {
        enabled = true,
        view = "mini",
      },
      lsp = {
        progress = { enabled = false },
        signature = { enabled = false },
        hover = { enabled = false },
      },
      presets = {
        bottom_search = true,    -- Clássico estilo de busca do vim
        command_palette = false, -- Requer configuração
        long_message_to_split = true,
      },
    },
  }
  