-- Sobrescreve a função vim.notify para filtrar mensagens de depreciação
vim.notify = function(msg, level, opts)
    -- Verifica se a mensagem contém "deprecated"
    if string.match(msg, "deprecated") then
      return -- Ignora a mensagem de depreciação
    end
    -- Caso contrário, exibe a mensagem normalmente
    vim.api.nvim_out_write(msg .. "\n")
  end
  
  
require("user.maps")
require("user.settings")
require("user.lazy")
pcall(require, "secrets")
