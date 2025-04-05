return {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local dashboard = require("alpha.themes.dashboard")
  
      -- Diminuir padding no topo
      dashboard.section.header.val = {
        -- Logo opcional (ou remova para tirar espaço!)
        "     AstroNvim",
      }
  
      -- Substituir os botões
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
      }
  
      -- Define padding superior (esse é o segredo!)
      dashboard.config.layout = {
        { type = "padding", val = 0 },
        dashboard.section.header,
        { type = "padding", val = 0 },
        dashboard.section.buttons,
        { type = "padding", val = 0 },
      }
  
      opts.config = dashboard.config
      return opts
    end,
  }
  