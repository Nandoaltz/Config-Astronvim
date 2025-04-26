return {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          huggingface = {
            api_key = "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",
            model = "bigscience/bloomz-1b7", -- modelo gratuito da Hugging Face
          },
        },
      })
    end,
  }
  