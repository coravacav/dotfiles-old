require('typescript').setup({
    debug = false,
    server = {
        on_attach = function(client, bufnr)
            -- vim.keymap.set('n', '<leader>ci', '<cmd>TypescriptAddMissingImports<cr>', { buffer = bufnr })
        end
    }
})
