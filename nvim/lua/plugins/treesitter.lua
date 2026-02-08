return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Newer treesitter exposes this API
    require("nvim-treesitter").setup({
      ensure_installed = {
        "c", "cpp", "rust", "python", "bash", "lua",
        "json", "yaml", "toml",
        "make", "cmake",
        "verilog",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

