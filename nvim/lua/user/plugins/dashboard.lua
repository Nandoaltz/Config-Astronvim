vim.api.nvim_create_autocmd("User", {
  pattern = "AlphaReady",
  callback = function()
    vim.cmd [[ set laststatus=0 | set showtabline=0 ]]
    vim.opt_local.fillchars:append("eob: ")
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

      -- Logo com diferentes cores por linha
      dashboard.section.header.val = {
          [[                             ]],
          [[     ▐ ▄ ▄▄▄ .       ▌ ▐·▪  • ▌ ▄ ·.  ]],
          [[    •█▌▐█▀▄.▀·▪     ▪█·█▌██ ·██ ▐███▪ ]],
          [[    ▐█▐▐▌▐▀▀▪▄ ▄█▀▄ ▐█▐█•▐█·▐█ ▌▐▌▐█· ]],
          [[    ██▐█▌▐█▄▄▌▐█▌.▐▌ ███ ▐█▌██ ██▌▐█▌ ]],
          [[    ▀▀ █▪ ▀▀▀  ▀█▄▀▪. ▀  ▀▀▀▀▀  █▪▀▀▀ ]],
          [[                                   ]],
          [[ ▄▄▄▄    ██▓     ▒█████   ▒█████  ▓█████▄ ]],
          [[▓█████▄ ▓██▒    ▒██▒  ██▒▒██▒  ██▒▒██▀ ██▌]],
          [[▒██▒ ▄██▒██░    ▒██░  ██▒▒██░  ██▒░██   █▌]],
          [[▒██░█▀  ▒██░    ▒██   ██░▒██   ██░░▓█▄   ▌]],
          [[░▓█  ▀█▓░██████▒░ ████▓▒░░ ████▓▒░░▒████▓ ]],
          [[░▒▓███▀▒░ ▒░▓  ░░ ▒░▒░▒░ ░ ▒░▒░▒░  ▒▒▓  ▒ ]],
          [[▒░▒   ░ ░ ░ ▒  ░  ░ ▒ ▒░   ░ ▒ ▒░  ░ ▒  ▒ ]],
          [[ ░    ░   ░ ░   ░ ░ ░ ▒  ░ ░ ░ ▒   ░ ░  ░ ]],
          [[ ░          ░  ░    ░ ░      ░ ░     ░    ]],
          [[      ░                            ░      ]],
      }

      -- Definindo as cores manualmente para cada linha (evita múltiplos destaques)
      vim.cmd("highlight AlphaHeader1 guifg=#ec0e04") -- Linha 1: Vermelho
      vim.cmd("highlight AlphaHeader2 guifg=#ff7f00") -- Linha 2: Laranja
      vim.cmd("highlight AlphaHeader3 guifg=#ffff00") -- Linha 3: Amarelo
      vim.cmd("highlight AlphaHeader4 guifg=#32cd32") -- Linha 4: Verde
      vim.cmd("highlight AlphaHeader5 guifg=#1e90ff") -- Linha 5: Azul
      vim.cmd("highlight AlphaHeader6 guifg=#8a2be2") -- Linha 6: Roxo

      -- Configurando a seção de cabeçalho com as cores definidas
      dashboard.section.header.opts = {
          position = "center",
          hl = "AlphaHeader6",
      }

      -- Botões
      dashboard.section.buttons.val = {
          dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
          dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
          dashboard.button("r", "󰝰  Recent files", ":Telescope oldfiles<CR>"),
          dashboard.button("s", "  Restore Session", [[:lua require("persistence").load() <cr>]]),
          dashboard.button("q", "  Quit", ":qa<CR>"),
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
