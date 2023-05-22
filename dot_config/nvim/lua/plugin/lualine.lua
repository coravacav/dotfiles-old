return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
        require('lualine').setup({
            globalstatus = true,
            sections = {
                lualine_x = { 'filetype' }
            }
        })
    end,
}
