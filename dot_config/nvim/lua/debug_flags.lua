local M = {}

local function should_debug(enabled)
    if enabled then
        return function(msg, type, opts)
            vim.notify(msg, type, opts)
        end
    end

    return function()
    end
end

-- Fancy printing functions
M.lsp_on_attach = should_debug(false)
M.lsp_on_format = should_debug(false)

M.keyset_current_buffer = should_debug(false)
M.keyset_global = should_debug(false)

M.update_variable = should_debug(false)

-- Boring boolean flags
M.null_ls = false

return M
