vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
      vim.cmd [[ set laststatus=0 | set showtabline=0 ]]
    end,
  })
  vim.api.nvim_create_autocmd("BufUnload", {
    buffer = 0,
    callback = function()
      vim.cmd [[ set laststatus=2 | set showtabline=2 ]]
    end,
  })
  
  return {
    "goolord/alpha-nvim",
    opts = function(_, _)
      local dashboard = require("alpha.themes.dashboard")
  
      -- AutoCmds para ocultar barra de status e tabline no Alpha
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          vim.cmd [[ set laststatus=0 | set showtabline=0 ]]
        end,
      })
      vim.api.nvim_create_autocmd("BufUnload", {
        buffer = 0,
        callback = function()
          vim.cmd [[ set laststatus=2 | set showtabline=2 ]]
        end,
      })
  
      -- Logo
      dashboard.section.header.val = {
[[                                                     ]],
	[[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
	[[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
	[[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
	[[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
	[[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
	[[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
	[[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
	[[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
	[[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
	[[                                 ░                   ]],
	[[                                                     ]],
      }
      dashboard.section.header.opts = {
        position = "center",
        hl = "AlphaHeader",
      }
      --vim.cmd([[highlight AlphaHeader guifg=#ffffff]])
      --vim.cmd([[highlight AlphaHeader guifg=#8B0000]])
      vim.cmd([[highlight AlphaHeader guifg=#ec0e04]])

  
      -- Botões
      dashboard.section.buttons.val = {
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "󰝰  Recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("s", "  Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("q", "  Quit", ":qa<CR>"),
      }
  
      -- Rodapé
      dashboard.section.footer.val = { "  Nando: Neovim Blood" }
      dashboard.section.footer.opts = {
        position = "center",
        hl = "Comment",
      }
  
      return dashboard.config
    end,
  }
