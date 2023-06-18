return {
    'rose-pine/neovim',
    config = function()
        require('rose-pine').setup({
            variant = 'moon',
            dark_variant = 'moon',
            disable_background = true,
        })

        vim.cmd('colorscheme rose-pine')

        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
    lazy = false,
    priority = 1000,
}
