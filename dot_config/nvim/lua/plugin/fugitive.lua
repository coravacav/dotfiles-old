-- This is the git plugin
return {
    'tpope/vim-fugitive',
    keys = {
        {'<leader>gss', ':vert Git | vert res 40<cr>', desc = 'Show fugitive (git) small, on the side'},
        {'<leader>gsf', ':Git<cr>', desc = 'Show fugitive (git) with (bad) default behavior'}
    },
}
