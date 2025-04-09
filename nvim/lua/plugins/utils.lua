
-- Verifica se o módulo 'nvim-web-devicons' está disponível antes de usar
local ok_icons, web_devicons = pcall(require, 'nvim-web-devicons')
if ok_icons then
  web_devicons.get_icons()
end

-- Verifica se o módulo 'lualine' está disponível
local ok_lualine, lualine = pcall(require, 'lualine')
if not ok_lualine then
  return -- Se não conseguir carregar, não continua
end

-- Função para mostrar o nome do LSP ativo
local function lsp_name()
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes or {}
    if vim.tbl_contains(filetypes, buf_ft) then
      return client.name
    end
  end
  return ''
end

-- Configuração do lualine
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'palenight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {"alpha", "dashboard", "NvimTree"},
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
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype', lsp_name},
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


-- ATUALIZAÇÕES PARA indent-blankline v3 (ibl)

-- define os caracteres invisíveis
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

-- destaque das colunas de indentação
vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#E06C75", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#E5C07B", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#98C379", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#56B6C2", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#61AFEF", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#C678DD", nocombine = true })

-- opcional: estilo do parêntese combinando
vim.cmd([[hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=NONE guifg=#FFFFFF]])

-- carregar ibl (nova API do indent-blankline v3)
require("ibl").setup({
  indent = {
    char = "│",
    highlight = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
    },
  },
  whitespace = {
    remove_blankline_trail = false,
  },
  scope = {
    enabled = false, -- ativa se quiser linhas conectando blocos
  },
  exclude = {
    filetypes = { "dashboard", "alpha", "starter" },
    buftypes = { "terminal", "nofile" },
  },
})

require("bufferline").setup{}

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cmdheight = 0

-- Carrega o lspconfig (garante que ele esteja disponível)
local lspconfig = require('lspconfig')

-- Carrega o módulo lspconfig de forma segura
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- Configura o LSP para Java usando o jdtls
lspconfig.jdtls.setup {
  cmd = { "jdtls" }, -- Comando para iniciar o servidor LSP do Java

  -- Define o diretório raiz do projeto, usando padrões comuns de projetos Java
  root_dir = lspconfig.util.root_pattern(
    ".git",        -- Projeto com controle de versão
    "mvnw",        -- Projeto Maven
    "gradlew",     -- Projeto Gradle
    "pom.xml",     -- Configuração Maven
    "build.gradle" -- Configuração Gradle
  ),

  -- Outras configurações opcionais, como on_attach ou capabilities, podem ser adicionadas aqui
}
