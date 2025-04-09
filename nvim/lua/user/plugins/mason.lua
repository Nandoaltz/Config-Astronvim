return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- Inicializa o Mason
        require("mason").setup()

        -- Configura o mason-lspconfig para instalar automaticamente LSPs
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "cssls",       -- CSS
                "eslint",      -- ESLint
                "html",        -- HTML
                "jsonls",      -- JSON
                "pyright",     -- Python
                "tailwindcss", -- Tailwind
                -- "tsserver" removido
            },
        })

        -- Instala ferramentas como formatadores e linters
        require("mason-tool-installer").setup({
            ensure_installed = {
                "prettier",    -- formatação geral
                "stylua",      -- formatação para Lua
               -- "isort",       -- ordenador de imports para Python
                --"black",       -- formatador Python
                "eslint_d",    -- ESLint versão rápida
                -- "typescript-language-server" removido
            },
        })

        -- Configura automaticamente os LSPs instalados
        local lspconfig = require("lspconfig")
        require("mason-lspconfig").setup_handlers {
            function(server_name)
                lspconfig[server_name].setup {}
            end,
        }
    end,
}
