return {
    'airblade/vim-gitgutter',
    config = function()
        vim.cmd('GitGutterToggle')
    end,
    lazy = false
}
