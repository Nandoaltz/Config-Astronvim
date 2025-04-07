return {
  {
    "nvim-java/nvim-java",
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("java").setup({
        root_markers = {
          "settings.gradle",
          "settings.gradle.kts",
          "pom.xml",
          "build.gradle",
          "mvnw",
          "gradlew",
          "build.gradle",
          "build.gradle.kts",
          ".git",
        },
        jdtls = { version = "v1.43.0" },
        lombok = { version = "nightly" },
        java_test = { enable = true, version = "0.40.1" },
        java_debug_adapter = { enable = true, version = "0.58.1" },
        spring_boot_tools = { enable = true, version = "1.59.0" }, --atualizado
        jdk = { auto_install = true, version = "17.0.2" },
        notifications = { dap = true },
        verification = {
          invalid_order = true,
          duplicate_setup_calls = true,
          invalid_mason_registry = false,
        },
        mason = {
          registries = {
            "github:nvim-java/mason-registry",
          },
        },
      })
    end,
  },
}
