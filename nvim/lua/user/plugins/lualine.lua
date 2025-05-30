return {
  "nvim-lualine/lualine.nvim",
   event = "BufReadPre",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
      local function lsp_name()
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if next(clients) == nil then
              return " "
          end
          local names = {}
          for _, client in pairs(clients) do
            
              table.insert(names, client.name)
          end
          return " " .. table.concat(names, ", ")
      end
      theme = require('lualine.themes.auto')
theme.normal.c.bg = '#1e1e2e' 

theme.command = {
a = { bg = '#be57bd', fg = '#1e1e2e', gui = 'bold' },
}

theme.normal.a.bg = '#be57bd'
theme.normal.z.bg = '#be57bd'

theme.insert.a.bg = '#be57bd' -- cor de fundo da seção 'a' em modo insert
theme.visual.a.bg = '#be57bd' -- cor de fundo da seção 'a' em modo visual
theme.replace.a.bg = '#be57bd'

      require('lualine').setup {
          options = {
            icons_enabled = true,
            theme = theme,
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
              statusline = { "neo-tree", "alpha" },
              winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
              statusline = 100,
              tabline = 100,
              winbar = 100,
            }
          },
          sections = {
            lualine_a = {'mode'},
             lualine_b = {
              {
                'branch',
                icon = ''
              },
              'diff',
              'diagnostics' 
            },
            lualine_c = {'filename'},
            lualine_x = {lsp_name,'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
          },
          tabline = {},
          winbar = {},
          inactive_winbar = {},
          extensions = {}
        }
  end,
}
