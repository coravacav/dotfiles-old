return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
    opts = {
        options = {
            separator_style = 'slant',
            always_show_bufferline = true,
            diagnostics = 'nvim_lsp',
            mode = 'tabs'
        },
    }
}
