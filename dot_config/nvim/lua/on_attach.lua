-- This file effectively acts as keybindings for the LSP
local ev = require 'extended_variables'
local debug_flags = require 'debug_flags'
local keys = require 'keys'
local wk = require 'which-key'

local lsp_bindings = {
    name = "LSP",
    a = { function()
            vim.lsp.buf.code_action()
        end, "Open code actions"},
}

local goto_bindings = {
    name = "Goto",
    [keys.symbol] = {
        name = "Goto symbol",
        [keys.definitions] = { function()
            require('telescope.builtin').lsp_definitions()
        end, "Goto symbol definition"},
        [keys.type_definitions] = { function()
            require('telescope.builtin').lsp_type_definitions()
        end, "Goto symbol type definition"},
        [keys.references] = { function()
            require('telescope.builtin').lsp_references()
        end, "Goto symbol references"},
        [keys.implementation] = { function()
            require('telescope.builtin').lsp_implementations()
        end, "Goto symbol implementation"},
    },
    [keys.buffer] = {
        name = "Goto document (buffer)",
        [keys.symbol] = { function()
            require('telescope.builtin').lsp_document_symbols()
        end, "Goto document (buffer) symbols"},
    },
    [keys.workspace] = {
        name = "Goto workspace",
        [keys.symbol] = { function()
            require('telescope.builtin').lsp_workspace_symbols()
            -- Possibly want require('telescope.builtin').lsp_dynamic_workspace_symbols()
        end, "Goto workspace symbols"},
    }
}

local format_bindings = {
    name = "Format",
    a = {
        function()
            vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end, "Format buffer"
    }
}

local toggle_bindings = {
    name = "Toggle",
    [keys.lsp] = {
        name = "Toggle LSP",
        [keys.lsp_line] = {
            function()
                local config = vim.diagnostic.config()
                vim.diagnostic.config({
                    virtual_text = not config.virtual_text,
                    virtual_lines = not config.virtual_lines,
                })
            end, "Toggle LSP line diagnostics"
        }
    }
}

local set_bindings = {
    name = "Set",
    [keys.lsp] = {
        name = "LSP",
        [keys.lsp_line] = {
            function()
                vim.diagnostic.config({
                    virtual_lines = true,
                })
            end, "Set LSP line diagnostics"
        }

    }
}

local unset_bindings = {
    name = "Unset",
    [keys.lsp] = {
        name = "LSP",
        [keys.lsp_line] = {
            function()
                vim.diagnostic.config({
                    virtual_lines = false,
                })
            end, "Unset LSP line diagnostics"
        }
    }
}

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

    -- local ls = require("luasnip")
    --
    -- vim.api.nvim_create_autocmd("InsertLeave", {
    --     callback = function()
    --         ls.session.current_nodes[bufnr] = nil
    --     end,
    --     buffer = bufnr,
    -- })

    wk.register({
            [keys.lsp] = lsp_bindings,
            [keys.goto] = goto_bindings,
            [keys.format] = format_bindings,
            [keys.toggle] = toggle_bindings,
            [keys.set] = set_bindings,
            [keys.unset] = unset_bindings,
    }, {
        buffer = bufnr,
        prefix = keys.leader,
    })
end
