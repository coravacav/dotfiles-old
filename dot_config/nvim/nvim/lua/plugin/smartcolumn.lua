return {
    "m4xshen/smartcolumn.nvim",
    event = "BufEnter",
    config = function() require("smartcolumn").setup({
        colorcolumn = '120',
    }) end
}
