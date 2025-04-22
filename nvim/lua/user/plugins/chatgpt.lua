return {
  "David-Kunz/gen.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("gen").setup({
      api_host = "http://localhost:11434",  -- URL da API do Ollama
      api_key = "",  -- Deixe vazio se não for necessário
      model = "phi3:mini",  -- O modelo que você quer usar, altere se necessário
      temperature = 0.7,
      max_tokens = 150,
      debug = false,
      keymaps = {
        ["<leader>gc"] = ":lua require('gen').start_chat()<CR>",
        ["<leader>gg"] = ":lua require('gen').generate_code()<CR>",
      },
    })
  end,
}
