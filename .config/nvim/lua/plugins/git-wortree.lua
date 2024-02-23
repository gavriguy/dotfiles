-- see https://github.com/ThePrimeagen/git-worktree.nvim
-- see https://github.com/LazyVim/LazyVim/discussions/1301
-- see https://www.lazyvim.org/configuration/plugins
--

return {
  "ThePrimeagen/git-worktree.nvim",
  config = function()
    require("telescope").load_extension("git_worktree")
  end,
  dependencies = { "nvim-telescope/telescope.nvim" },
  keys = {
    {
      "<leader>sp",
      "<cmd>:lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
      desc = "create worktree",
    },
    {
      "<leader>sP",
      "<cmd>:lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
      desc = "swich worktree",
    },
  },
}
