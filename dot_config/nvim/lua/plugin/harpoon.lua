local keys = require 'keys'

return {
    'theprimeagen/harpoon',
    keys = {
        keys.leader .. keys.harpoon .. "a",
        keys.leader .. keys.harpoon .. "e",
        keys.leader .. keys.harpoon .. keys.next,
        keys.leader .. keys.harpoon .. keys.previous,
    },
    dependencies = { 'nvim-lua/plenary.nvim' }
}
