return {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- Requerido para algumas funcionalidades
      "hrsh7th/nvim-cmp",       -- Integra o Codeium com o nvim-cmp
    },
    config = function()
      -- Inicializa o Codeium
      require("codeium").setup({
        -- Configurações gerais
        completion = {
          enabled = true,                -- Habilita sugestões
          autocomplete_on_enter = true,  -- Inicia automaticamente ao digitar
          insert_result_key = "<Tab>",   -- Aceita a sugestão pressionando Tab
          show_autocomplete = true,     -- Exibe as sugestões enquanto digita
        },
        keymap = {
          accept = "<Tab>",            -- Aceita a sugestão pressionando Tab
          next_suggestion = "<C-n>",   -- Próxima sugestão com Ctrl+n
          prev_suggestion = "<C-p>",   -- Sugestão anterior com Ctrl+p
          dismiss_suggestion = "<Esc>", -- Fecha as sugestões com Esc
        },
        delay = 50,  -- Tempo de espera para sugestões aparecerem
      })
      
      -- Configura o nvim-cmp para trabalhar com o Codeium
      local cmp = require("cmp")
      cmp.setup({
        completion = {
          autocomplete = {cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertEnter}, -- Exibe sugestões enquanto digita
        },
        sources = {
          { name = "codeium" },  -- Codeium como fonte de sugestões no nvim-cmp
        },
      })
    end
  }
  
