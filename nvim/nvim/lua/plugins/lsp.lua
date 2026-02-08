return {
  "neovim/nvim-lspconfig",
  config = function()
    -- optional: per-server settings
    vim.lsp.config("pyright", {})
    vim.lsp.config("clangd", {})
    vim.lsp.config("lua_ls", {})

    -- enable servers
    vim.lsp.enable("pyright")
    vim.lsp.enable("clangd")
    vim.lsp.enable("lua_ls")
  end,
}

