return {
    {
      "mfussenegger/nvim-jdtls",
      ft = { "java" },
      config = function()
        local jdtls = require("jdtls")
        local mason_registry = require("mason-registry")
        local jdtls_path = mason_registry.get_package("jdtls"):get_install_path()
  
        -- Encontrar o .jar do launcher (nome varia com a versão)
        local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
  
        -- Detecta o sistema operacional
        local os_config
        if vim.fn.has("mac") == 1 then
          os_config = "config_mac"
        elseif vim.fn.has("unix") == 1 then
          os_config = "config_linux"
        else
          os_config = "config_win"
        end
  
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
  
        local config = {
          cmd = {
            "java",
            "-Declipse.application=org.eclipse.jdt.ls.core.id1",
            "-Dosgi.bundles.defaultStartLevel=4",
            "-Declipse.product=org.eclipse.jdt.ls.core.product",
            "-Dlog.protocol=true",
            "-Dlog.level=ALL",
            "-Xms1g",
            "--add-modules=ALL-SYSTEM",
            "--add-opens", "java.base/java.util=ALL-UNNAMED",
            "--add-opens", "java.base/java.lang=ALL-UNNAMED",
            "-jar", launcher_jar,
            "-configuration", jdtls_path .. "/" .. os_config,
            "-data", workspace_dir,
          },
  
          root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
  
          settings = {
            java = {},
          },
        }
  
        jdtls.start_or_attach(config)
      end,
    },
  }
  