return {
    'rose-pine/neovim',
    config = function()
        require('rose-pine').setup({
            variant = 'moon',
            dark_variant = 'moon',
        })

        vim.cmd('colorscheme rose-pine')
    end,
    lazy = false,
    priority = 1000,
}
