return {
    "m4xshen/smartcolumn.nvim",
    lazy = false,
    config = function() require("smartcolumn").setup({
        colorcolumn = '120',
    }) end
}
