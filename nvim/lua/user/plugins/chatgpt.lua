return {
  {
    "David-Kunz/gen.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("gen").setup({
        model = "deepseek-coder",
        host = "localhost",
        port = "11434",
        display_mode = "split",
        show_prompt = "full",
        show_model = false,
        no_auto_close = true,
        file = false,
        hidden = false,
        init = function()
          pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
        end,
        command = function(options)
          local body = { model = options.model, stream = true }
          return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
        end,
        result_filetype = "markdown",
        debug = false,
      })

      -- Chatbot customizado com nui.nvim
      local Popup = require("nui.popup")
      local Input = require("nui.input")
      local event = require("nui.utils.autocmd").event

      local chat_history = {}

      function _G.open_chatbot()
        local popup = Popup({
          enter = true,
          focusable = true,
          border = {
            style = "rounded",
            text = { top = " Chatbot ", top_align = "center" },
          },
          position = "50%",
          size = { width = "80%", height = "60%" },
          buf_options = { modifiable = true, readonly = false },
        })

        popup:mount()

        local input = Input({
          position = { row = "90%", col = "10%" },
          size = { width = "70%" },
          border = {
            style = "single",
            text = { top = " Sua pergunta ", top_align = "left" },
          },
        }, {
          prompt = "> ",
          default_value = "",
          on_submit = function(value)
            table.insert(chat_history, "Você: " .. value)
            if vim.api.nvim_buf_is_valid(popup.bufnr) then
              vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, chat_history)
            end

            require("gen").prompt(value, function(response)
              table.insert(chat_history, "Bot: " .. response)
              if vim.api.nvim_buf_is_valid(popup.bufnr) then
                vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, chat_history)
              end
            end)
          end,
        })

        input:mount()

        popup:on(event.BufLeave, function()
          popup:unmount()
          input:unmount()
        end)
      end
    end,
  }
}
