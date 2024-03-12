local nnoremap = require("user.keymap_utils").nnoremap

-- Map Oil to <leader>e
nnoremap("<leader>e", function()
  require("oil").toggle_float()
end)
