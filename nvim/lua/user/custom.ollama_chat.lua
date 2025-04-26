local M = {}
local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local popup = nil

function M.toggle_ollama_chat()
  if popup then
    popup:unmount()
    popup = nil
    return
  end

  popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
      text = {
        top = " Chat com Ollama ",
        top_align = "center",
      },
    },
    position = "50%",
    size = {
      width = "80%",
      height = "60%",
    },
    buf_options = {
      modifiable = true,
      readonly = false,
    },
  })

  popup:mount()

  popup:on(event.BufLeave, function()
    popup:unmount()
    popup = nil
  end)

  vim.keymap.set("n", "<CR>", function()
    local input = vim.api.nvim_buf_get_lines(popup.bufnr, 0, -1, false)
    local prompt = table.concat(input, "\n")

    local Job = require("plenary.job")
    Job:new({
      command = "curl",
      args = {
        "-s", "-X", "POST",
        "http://localhost:11434/api/generate",
        "-d",
        vim.fn.json_encode({
          model = "llama2",
          prompt = prompt,
          stream = false,
        }),
      },
      on_exit = function(j, return_val)
        local result = table.concat(j:result(), "\n")
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(popup.bufnr, -1, -1, false, { "", "---", "Resposta:", result })
        end)
      end,
    }):start()
  end, { buffer = popup.bufnr, desc = "Enviar prompt para o Ollama" })
end

return M
