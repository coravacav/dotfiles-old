-- This is the git plugin
return {
    'tpope/vim-fugitive',
    keys = {
        {'<leader>gs', function() vim.cmd('vert Git | vert res 40') end }
    },
}
