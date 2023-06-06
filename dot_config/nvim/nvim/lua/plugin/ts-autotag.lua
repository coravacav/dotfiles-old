return {
    'windwp/nvim-ts-autotag',
    ft = { 'typescriptreact', 'svelte', 'html' },
    config = function()
        require('nvim-ts-autotag').setup()
    end,
}
