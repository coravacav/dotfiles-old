local keys = require 'keys'

return {
    'akinsho/toggleterm.nvim',
    opts = {
        float_opts = {
            border = 'curved'
        }
    },
    keys = {
            keys.leader .. keys.toggle .. '\\',
    }
}
