return {
    'rose-pine/neovim',
    config = function()
        require('rose-pine').setup({
            variant = 'moon',
            dark_variant = 'moon',
            disable_background = true,
            disable_float_background = true,
        })

        vim.cmd('colorscheme rose-pine')
    end,
    lazy = false,
    priority = 1000,
}
