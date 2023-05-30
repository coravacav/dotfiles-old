require 'keyset'

return {
    'akinsho/toggleterm.nvim',
    opts = {
        float_opts = {
            border = 'curved'
        }
    },
    keys = {
        {
            desc = "Open floating terminal",
            Leader .. Toggle .. '\\',
            '<cmd>ToggleTerm direction=float<cr>'
        },
    }
}
