:return {
  "williamboman/mason.nvim",
  dependencies = { 
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    --imports mason
    local mason = require("mason")
    
    --import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and config icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "Yay",
          package_pending = "wait...",
          package_uninstalled = "X"          
        }
      }
    })

    mason_lspconfig.setup({
      --list of servers for mason to install 
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "clangd",
      },
      -- auto-install configured servers
      automatic_installation = true,
    })
  end,
}
