local keys = require 'keys'

return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        keys.leader .. keys.toggle .. keys.trouble .. keys.close,
        keys.leader .. keys.toggle .. keys.trouble .. keys.buffer,
        keys.leader .. keys.toggle .. keys.trouble .. keys.workspace,
        keys.leader .. keys.toggle .. keys.trouble .. keys.references,
        keys.leader .. keys.toggle .. keys.trouble .. keys.definitions,
        keys.leader .. keys.toggle .. keys.trouble .. keys.type_definitions,
        keys.leader .. keys.toggle .. keys.trouble .. keys.quickfixes,
        keys.leader .. keys.toggle .. keys.trouble .. 'l',
    },
    opts = {},
}
