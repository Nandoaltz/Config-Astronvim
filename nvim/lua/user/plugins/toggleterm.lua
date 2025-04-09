return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]], -- Atalho padrão: Ctrl + \
        direction = "float", -- padrão: terminal flutuante
        float_opts = {
          border = "curved",
        },
        start_in_insert = true,
        persist_size = true,
        persist_mode = true,
      })
  
      -- Terminal horizontal
      vim.keymap.set("n", "<leader>th", function()
        require("toggleterm.terminal").Terminal
          :new({ direction = "horizontal" }):toggle()
      end, { desc = "Terminal Horizontal" })
  
      -- Terminal vertical
      vim.keymap.set("n", "<leader>tv", function()
        require("toggleterm.terminal").Terminal
          :new({ direction = "vertical" }):toggle()
      end, { desc = "Terminal Vertical" })
  
      -- Terminal flutuante
      vim.keymap.set("n", "<leader>tf", function()
        require("toggleterm.terminal").Terminal
          :new({ direction = "float" }):toggle()
      end, { desc = "Terminal Flutuante" })
    end,
  }
  