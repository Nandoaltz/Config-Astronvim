-- /.config/nvim/lua/plugins/colorschene.lua
  --return {
  --  {
  --    "nyoom-engineering/oxocarbon.nvim",
  --    lazy = false,
  --    priority = 1000,
  --    config = function()
  --      vim.opt.background = "dark" -- ou "light" se quiser versão clara
  --      vim.cmd.colorscheme("oxocarbon")
  --    end,
  --  },
  --}

 return {
    {
      "mcchrish/zenbones.nvim", -- nome correto do repositório
      lazy = false,
      priority = 1000,
      dependencies = {
        "rktjmp/lush.nvim", -- dependência obrigatória
      },
      config = function()
        vim.cmd.colorscheme("zenbones") -- pode trocar por 'neobones', 'forestbones', etc.
      end,
    },
  }

  --   return {
 --   "folke/tokyonight.nvim",
 --   lazy = false,
 --   priority = 1000,
 --   opts = {
 --     style = "moon", -- ou "night", "moon", "day"
 --     transparent = false,
 --     styles = {
 --       sidebars = "dark",
 --       floats = "dark",
 --     },
 --   },
 --   config = function(_, opts)
 --     require("tokyonight").setup(opts)
 --     vim.cmd.colorscheme("tokyonight")
 --   end,
 -- }
  
  --return {
  --  {
  --    "projekt0n/github-nvim-theme",
  --    priority = 1000,
  --    config = function()
  --      require("github-theme").setup({})
  --      vim.cmd("colorscheme github_dark_default")
  --    end,
  --  },
  --}
  
  --return {
  --  {
  --    "Mofiqul/dracula.nvim",
  --    priority = 1000,
  --    config = function()
  --      -- Configuração opcional
  --      require("dracula").setup({
  --        italic_comment = true,
  --      })
  --
  --      -- Ativa o tema
  --      vim.cmd("colorscheme dracula")
  --    end,
  --  },
  --}
  
  
