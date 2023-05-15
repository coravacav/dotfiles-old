return {
    'theprimeagen/harpoon',
    keys = {
        {"<leader>ha", function () require("harpoon.mark").add_file() end, desc = "Mark current file"},
        {"<leader>he", function () require("harpoon.ui").toggle_quick_menu() end, desc = "See harpoon menu"},
        {"<leader>h<right>", function () require("harpoon.ui").nav_next() end, desc = "See harpoon menu"},
        {"<leader>h<left>", function () require("harpoon.ui").nav_prev() end, desc = "See harpoon menu"},
    },
	dependencies = { 'nvim-lua/plenary.nvim' }
}
