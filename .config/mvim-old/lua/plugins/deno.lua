return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {
        root_dir = require("lspconfig.util").root_pattern("package.json"),
        single_file_support = false,
      },
    },
  },
}
