-- This file effectively acts as keybindings for the LSP
local extended_variables = require 'extended_variables'
local debug_flags = require 'debug_flags'

return function(client, bufnr)
    debug_flags.lsp_on_attach(client.name, 'info', {
        title = 'LSP attached',
    })

    -- Prevent formatting capabilities, we have prettier and eslint anyway
    if client.name == 'tsserver' then
        vim.b[extended_variables.telescope_file_ignore_patterns] = { '%.snap', '^node_modules' }
        debug_flags.config_set('ignored .snap and node_modules')
        client.resolved_capabilities.document_formatting = false
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    KeysetB('Go to symbol definition', 'n',
        Leader .. Goto .. Symbol .. 'd',
        function()
            require('telescope.builtin').lsp_definitions()
        end, bufnr)

    KeysetB('Go to symbol type definition', 'n',
        Leader .. Goto .. Symbol .. 't',
        function()
            require('telescope.builtin').lsp_type_definitions()
        end, bufnr)

    KeysetB('Go to symbol references', 'n',
        Leader .. Goto .. Symbol .. 'r',
        function()
            require('telescope.builtin').lsp_references()
        end, bufnr)

    KeysetB('Go to symbol implementation', 'n',
        Leader .. Goto .. Symbol .. 'i',
        function()
            require('telescope.builtin').lsp_implementations()
        end, bufnr)

    KeysetB('Go to document (buffer) symbols', 'n',
        Leader .. Goto .. Buffer .. Symbol,
        function()
            require('telescope.builtin').lsp_document_symbols()
        end, bufnr)

    KeysetB('Go to workspace symbols', 'n',
        Leader .. Goto .. Workspace .. Symbol,
        function()
            require('telescope.builtin').lsp_workspace_symbols()
            -- Possibly want require('telescope.builtin').lsp_dynamic_workspace_symbols()
        end, bufnr)

    KeysetB('Open code actions', 'n',
        Leader .. LSP .. 'a',
        function()
            vim.lsp.buf.code_action()
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
