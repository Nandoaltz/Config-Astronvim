return{
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- garante que o Copilot está presente
      { "nvim-lua/plenary.nvim" }, -- dependência necessária
    },
    config = function()
      require("CopilotChat").setup()
    end,
    cmd = "CopilotChat", -- lazy loading com comando
  }
  