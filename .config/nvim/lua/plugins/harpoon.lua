return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>hq", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "harpoon menu" },
    { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "harpoon menu" },
    { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "harpoon menu" },
    { "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "harpoon add file" },
    { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "harpoon remove file" },
  },
}
