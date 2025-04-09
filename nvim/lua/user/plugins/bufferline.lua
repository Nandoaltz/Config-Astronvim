return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          show_buffer_close_icons = true,
          show_close_icon = false,
          buffer_close_icon = "",
          modified_icon = "●",
  
          -- 👇 Força sempre mostrar só o nome do arquivo
          name_formatter = function(buf)
            return vim.fn.fnamemodify(buf.name, ":t") -- ex: "index.js"
          end,
  
          -- 👇 Esta opção resolve o problema: substitui nomes de buffers
          custom_filter = function(buf_number)
            local name = vim.fn.bufname(buf_number)
            return not name:match("NvimTree") -- Oculta buffers do NvimTree
          end,
  
          -- 👇 Adiciona offset para alinhar com NvimTree
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
              separator = true,
            },
          },
  
          -- 👇 Evita exibir caminho inteiro ao invés do nome
          get_element_icon = function(element)
            return require("nvim-web-devicons").get_icon(element.filename, element.extension, { default = true })
          end,
  
          -- 👇 Remapeia nome de buffer sempre para apenas o nome
          name_formatter = function(buf)
            return vim.fn.fnamemodify(buf.name, ":t") -- só "index.js"
          end,
  
          -- 👇 ESSENCIAL: sobrescreve nome mesmo em caso de conflitos
          overrides = {
            name = function(buf)
              return vim.fn.fnamemodify(buf.name, ":t") -- só "index.js"
            end,
          },
        },
      })
  
      -- Atalhos para navegar entre buffers
      vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Próximo buffer" })
      vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Buffer anterior" })
    end,
  }
  