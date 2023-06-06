local keys = require 'keys'

return {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    keys = {
            keys.leader .. Toggle .. keys.trouble .. keys.buffer,
            keys.leader .. Toggle .. keys.trouble .. keys.workspace,
            keys.leader .. Toggle .. keys.trouble .. 'r',
            keys.leader .. Toggle .. keys.trouble .. 'd',
            keys.leader .. Toggle .. keys.trouble .. 't',
            keys.leader .. Toggle .. keys.trouble .. 'q',
            keys.leader .. Toggle .. keys.trouble .. 'l',
            keys.leader .. LSP .. keys.trouble .. keys.next,
            keys.leader .. LSP .. keys.trouble .. keys.previous,
            keys.leader .. LSP .. keys.trouble .. keys.last,
            keys.leader .. LSP .. keys.trouble .. keys.first,
    },
    opts = {},
}
