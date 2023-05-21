return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = false,
    config = function()
        -- Entrypoint to all LSP configs here.

        local lsp = require('lsp-zero').preset({})

        -- This is shared with everything, keep it in one spot
        lsp.on_attach(require('lsp_configs.on_attach'))

        -- This is for NVIM Lua support.
        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

        -- This is all the servers mason will ensure are installed
        lsp.ensure_installed(require('lsp_configs.ensure_installed'))

        -- We handle this with typescript.nvim instead
        lsp.skip_server_setup({ 'tsserver' })

        -- Start lsp-zero
        lsp.setup()

        -- Setup configs after lsp-zero is "setup"
        require('lsp_configs.lang_configs')

        -- Setup completion
        require('lsp_configs.cmp')

        -- Make errors pretty (when they're turned on)
        require('lsp_lines').setup()
        -- By default I don't really actually want them, cool though.
        vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = false,
        })
    end,
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

        -- Make errors prettier
        { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },

        -- Add more lua help for neovim
        {
            'folke/neodev.nvim',
            ft = 'lua',
            config = function()
                require('neodev').setup()
            end
            -- Config languages individually
        }
    },
}
