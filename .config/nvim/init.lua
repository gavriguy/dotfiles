-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.opt.spelllang = "en_us"
-- vim.opt.spell = true
--
--
-- load snippets from path/of/your/nvim/config/my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/my-snippets" } })
