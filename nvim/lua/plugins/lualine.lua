-- Arquivo: lua/plugins/lualine.lua
-- Esse arquivo será carregado pelo lazy.nvim

return {
  -- Plugin da statusline
  'nvim-lualine/lualine.nvim',

  -- Dependência para ícones bonitos na statusline
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- recomendado, mas opcional
  },

  config = function()
    -- Função para mostrar o nome do LSP conectado (sem duplicatas e ignorando alguns)
    local function lsp_name()
      local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if not buf_clients or vim.tbl_isempty(buf_clients) then
        return ''
      end

      local ignore = {
        ['null-ls'] = true,
        ['copilot'] = true,
      }

      local names = {}
      for _, client in pairs(buf_clients) do
        if not ignore[client.name] then
          table.insert(names, client.name)
        end
      end

      if #names == 0 then
        return ''
      end

      -- Remover duplicatas
      local unique_names = {}
      local seen = {}
      for _, name in ipairs(names) do
        if not seen[name] then
          table.insert(unique_names, name)
          seen[name] = true
        end
      end

      return ' ' .. table.concat(unique_names, ', ')
    end

    -- Configuração do lualine
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'palenight',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
      },

      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          'filename',
          lsp_name -- Adiciona a função do LSP aqui
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },

      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },

      tabline = {},
      extensions = {}
    }
  end
}
