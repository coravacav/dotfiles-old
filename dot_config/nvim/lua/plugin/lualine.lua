return {
    'nvim-lualine/lualine.nvim',
    event = "BufEnter",
    config = function()
        require('lualine').setup {
            options = {
                theme = 'tokyonight',
            },
            globalstatus = true,
            sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                    }
                },
                lualine_x = { 'filetype' }
            }
        }
    end,
}
