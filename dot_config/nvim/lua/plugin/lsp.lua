return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {
            -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required

        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'saadparwaiz1/cmp_luasnip' },

        -- Better completion display
        { 'onsails/lspkind.nvim' },

        -- More LSP configuration helpers (for prettier atm)
        { 'jose-elias-alvarez/null-ls.nvim' },

        -- Rust
        { 'simrat39/rust-tools.nvim' },

        -- Typescript
        { 'jose-elias-alvarez/typescript.nvim' },

        -- Prettier
        { 'MunifTanjim/prettier.nvim' },
    },
    lazy = false,
    config = function()
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(client, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
            local opts = { buffer = bufnr }


            vim.keymap.set({ 'n', 'x' }, '<leader>fa', function()
                vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
            end, opts)
        end)

        -- (Optional) Configure lua language server for neovim
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        lsp.ensure_installed({
            'lua_ls',
            'taplo',
            'tsserver',
            'eslint',
            'rust_analyzer',
            'cssls',
            'tailwindcss',
            'svelte',
            'yamlls',
            'marksman',
            'jsonls',
            'html',
        })

        -- We handle this with typescript.nvim instead
        lsp.skip_server_setup({ 'tsserver' })

        -- Start lsp-zero
        lsp.setup()

        -- Config languages individually
        require('lsp_configs/rust')
        require('lsp_configs/typescript')
        require('lsp_configs/prettier')

        -- Completion
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        cmp.setup({
            formatting = {
                format = require('lspkind').cmp_format(),
            },
            mapping = {
                -- `Enter` key to confirm completion
                ['<cr>'] = cmp.mapping.confirm({ select = false }),

                -- Ctrl+Space to trigger completion menu
                ['<c-space>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                -- ['<c-f>'] = cmp_action.luasnip_jump_forward(),
                -- ['<c-b>'] = cmp_action.luasnip_jump_backward(),
            },
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'buffer',  keyword_length = 3 },
                { name = 'luasnip', keyword_length = 2 },
            },
        })
    end
}
