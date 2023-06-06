-- This is the git plugin
return {
    'tpope/vim-fugitive',
    keys = {
        {
            desc = 'Show fugitive (git) small, on the side',
            '<leader>gss',
            '<cmd>:vert Git | vert res 40<cr>',
        },
        {
            desc = 'Show fugitive (git) with (bad) default behavior',
            '<leader>gsf',
            '<cmd>:Git<cr>',
        }
    },
}
