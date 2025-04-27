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
      delay = 30,  -- Tempo de espera para sugestões aparecerem
    })

    -- Configura o nvim-cmp para trabalhar com o Codeium
    local cmp = require("cmp")
    cmp.setup({
      completion = {
        autocomplete = {cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertEnter}, -- Exibe sugestões enquanto digita
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),  -- Ativa o autocompletar manualmente
        ["<C-e>"] = cmp.mapping.close(),         -- Fecha o autocomplete
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),  -- Confirma a sugestão
      }),
      sources = cmp.config.sources({
        { name = "codeium" },  -- Codeium como fonte de sugestões no nvim-cmp
        { name = "nvim_lsp" },  -- Fonte de LSP, caso você utilize
        { name = "buffer" },    -- Fonte do buffer de texto
        { name = "path" },      -- Fonte de caminhos de arquivo
      }),
      window = {
        completion = {
          border = 'rounded',  -- Bordas arredondadas
          winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:PmenuSel',  -- Cor da seleção
        },
        documentation = {
          border = 'rounded',  -- Bordas arredondadas para a documentação
          winhighlight = 'Normal:CmpDoc,CursorLine:CmpDocSel',  -- Cor da documentação
        },
      },
    })
  end
}
