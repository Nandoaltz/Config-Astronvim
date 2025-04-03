return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "jdtls" }, -- Instala automaticamente o LSP do Java
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = {
          settings = {
            java = {
              signatureHelp = { enabled = true },
              contentProvider = { preferred = "fernflower" },
              completion = {
                favoriteStaticMembers = {
                  "org.mockito.Mockito.*",
                  "org.junit.Assert.*",
                  "org.junit.Assume.*",
                },
              },
            },
          },
        },
      },
    },
  },
}
