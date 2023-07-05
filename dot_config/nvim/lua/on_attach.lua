-- This file effectively acts as keybindings for the LSP
local ev = require 'extended_variables'
local debug_flags = require 'debug_flags'
local onemap = require 'onemap'

return function(client, bufnr)
    debug_flags.lsp_on_attach(client.name, 'info', {
        title = 'LSP attached',
    })

    -- Prevent formatting capabilities, we have prettier and eslint anyway
    if client.name == 'tsserver' then
        ev.telescope_file_ignore_patterns.set_buffer("{ '%.snap', '^node_modules' }")
        client.resolved_capabilities.document_formatting = false
    end

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })

    onemap.toggle('lsp', true)
end
