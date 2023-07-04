return {
    "folke/tokyonight.nvim",
    config = function()
        require('tokyonight').setup {
            style = 'moon',
        }

        vim.cmd.colorscheme "tokyonight"
    end,
    lazy = false,
    priority = 1000,
}
