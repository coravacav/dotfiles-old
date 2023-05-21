local cmp = require('cmp')
local lsp = require("lsp-zero")

cmp.setup({
    mapping = lsp.defaults.cmp_mappings({
        -- `Enter` key to confirm completion
        ['<cr>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<c-space>'] = cmp.mapping.complete(),
    }),
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = 'nvim_lua' },
        { name = "buffer",  keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
        { name = "copilot", group_index = 2 },
    },
    formatting = {
        format = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = {
                Copilot = "",
            },
        }),
    },
})
