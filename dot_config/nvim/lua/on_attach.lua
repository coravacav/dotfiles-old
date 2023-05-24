return function(client, bufnr)
    if client.name == 'tsserver' then
        client.resolved_capabilities.document_formatting = false
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    KeysetB('Go to definition', 'n',
        Leader .. Goto .. Symbol .. 'd',
        function()
            vim.lsp.buf.definition()
        end, bufnr)

    KeysetB('Go to type definition', 'n',
        Leader .. Goto .. Symbol .. 't',
        function()
            vim.lsp.buf.type_definition()
        end, bufnr)

    KeysetB('Go to references', 'n',
        Leader .. Goto .. Symbol .. 'r',
        function()
            vim.lsp.buf.type_definition()
        end, bufnr)

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
