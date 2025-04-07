return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local jdtls = require("jdtls")

    -- Caminhos
    local home = os.getenv("HOME")
    local mason_path = home .. "/.local/share/nvim/mason/packages/jdtls"
    local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

    local config = {
      cmd = {
        mason_path .. "/bin/jdtls",
        "-data", workspace_dir,
      },
      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
      settings = {
        java = {
          signatureHelp = { enabled = true },
          contentProvider = { preferred = "fernflower" },
          format = {
            enabled = true,
          },
        },
      },
      init_options = {
        bundles = {},
      },
    }

    jdtls.start_or_attach(config)
  end,
}
