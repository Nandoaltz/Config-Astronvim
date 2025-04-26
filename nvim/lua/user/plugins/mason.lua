return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim", -- Plugin para integrar Mason com LSPConfig
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- Plugin para instalar ferramentas extras (formatadores, linters)
    },
    config = function()
        -- Inicializa o Mason (gerenciador de LSPs, DAPs, linters e formatadores)
        require("mason").setup()

        -- Requer o módulo mason-lspconfig apenas uma vez
        local mason_lspconfig = require("mason-lspconfig")

        -- Configura o mason-lspconfig para instalar automaticamente servidores LSP
        mason_lspconfig.setup({
            automatic_installation = true, -- Instala LSPs automaticamente ao detectar
            ensure_installed = {
                "cssls",   -- Servidor para CSS
                "eslint",  -- Servidor para lint de JavaScript/TypeScript
                "html",    -- Servidor para HTML
                "jsonls",  -- Servidor para JSON
                -- "pyright",     -- Descomente se quiser Python
                -- "tailwindcss", -- Descomente se quiser Tailwind
                -- "tsserver",    -- Descomente se quiser TypeScript
            },
        })

        -- Instala ferramentas adicionais como formatadores e linters
        require("mason-tool-installer").setup({
            ensure_installed = {
                "stylua", -- Formatador para arquivos Lua
                -- "prettier", -- Formatação geral para frontend
                -- "isort",    -- Organizador de imports Python
                -- "black",    -- Formatador de código Python
                -- "eslint_d", -- ESLint rápido
            },
        })

        -- Carrega o módulo lspconfig para configurar os LSPs
        local lspconfig = require("lspconfig")

        -- Configura automaticamente cada servidor LSP instalado
        mason_lspconfig.setup_handlers({
            function(server_name)
                -- Para cada servidor instalado, faz a configuração padrão
                lspconfig[server_name].setup({})
            end,
        })
    end,
}
