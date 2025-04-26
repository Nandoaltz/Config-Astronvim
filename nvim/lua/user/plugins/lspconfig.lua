return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local nvim_lsp = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local protocol = require("vim.lsp.protocol")

        local on_attach = function(client, bufnr)
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })
            end
        end

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        mason_lspconfig.setup_handlers({
            function(server)
                nvim_lsp[server].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,

            -- Pode colocar servidores com configurações específicas também aqui
            ["gopls"] = function()
                nvim_lsp["gopls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            -- etc
        })
    end,
}
