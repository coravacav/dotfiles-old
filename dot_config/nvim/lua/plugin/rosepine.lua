return {
    'rose-pine/neovim',
    dependencies = { 'xiyaowong/transparent.nvim' },
    config = function()
        require('rose-pine').setup({
            variant = 'moon',
            dark_variant = 'moon',
        })

        vim.cmd('colorscheme rose-pine')

        require('transparent').setup {}
        vim.cmd(':TransparentEnable')
    end,
    lazy = false,
    priority = 1000,
}
