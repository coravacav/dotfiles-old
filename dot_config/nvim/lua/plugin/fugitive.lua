-- This is the git plugin
return {
    'tpope/vim-fugitive',
    keys = {
        {'<leader>gs', function() vim.cmd.Git() end }
    },
}
