require('keyset')

-- This file essentially just sets LSP keybindings

return function(client, bufnr)
    KeysetB('Format file', { 'n', 'x' },
        Leader .. Format .. 'a',
        function()
            vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end, bufnr)

    KeysetB(
        'Toggle Line Diagnostics', 'n',
        Leader .. Toggle .. LSP .. 'l',
        function()
            local config = vim.diagnostic.config()
            vim.diagnostic.config({
                virtual_text = not config.virtual_text,
                virtual_lines = not config.virtual_lines,
            })
        end, bufnr)
end
