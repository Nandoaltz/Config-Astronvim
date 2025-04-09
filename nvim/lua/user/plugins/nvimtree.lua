return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Ícones
    },
    config = function()
      require("nvim-tree").setup({})
      -- Atalho para abrir com <leader>e (ex: espaço + e)
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
    end,
  }
  