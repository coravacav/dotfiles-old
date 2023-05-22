return {
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            -- Install LSP servers automatically
            {
                'williamboman/mason.nvim',
                build = ':MasonUpdate',
            },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Make errors prettier
            { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },

            -- Add more lua help for neovim
            { 'folke/neodev.nvim', },

            -- Completion
            { 'ms-jpq/coq_nvim',                             branch = 'coq', },
            { 'ms-jpq/coq.artifacts',                        branch = 'artifacts', },
            { 'ms-jpq/coq.thirdparty',                       branch = '3p' },

            -- Rust
            { 'simrat39/rust-tools.nvim' },

            -- Copilot
            { 'github/copilot.vim', },

            -- Eslint
            { 'MunifTanjim/eslint.nvim' },

            -- Typescript
            { 'jose-elias-alvarez/typescript.nvim' },

            -- Eslint
            { 'MunifTanjim/prettier.nvim' }
        },
        config = function()
            -- neovim lua setup
            require('neodev').setup()

            local lsp = require 'lspconfig'
            local coq = require 'coq'

            lsp.util.default_config.capabilities = vim.tbl_deep_extend(
                'force',
                lsp.util.default_config.capabilities,
                coq.lsp_ensure_capabilities()
            )

            -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    require 'keyset'
                    local bufnr = ev.buf

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

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    -- local opts = { buffer = ev.buf }
                    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    -- vim.keymap.set('n', '<space>wl', function()
                    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                    -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    -- vim.keymap.set('n', '<space>f', function()
                    --     vim.lsp.buf.format { async = true }
                    -- end, opts)
                end,
            })

            -- This is all the servers mason will ensure are installed
            require('mason').setup()
            require('mason-lspconfig').setup {
                ensure_installed = {
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
                    'bashls',
                    'jsonls',
                    'html',
                }
            }

            -- NVIM lua
            lsp.lua_ls.setup({
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace"
                        },
                        workspace = {
                            checkThirdParty = false
                        }
                    }
                }
            })

            -- Rust
            require 'rust-tools'.setup {
                tools = {
                    inlay_hints = {
                        auto = false,
                    }
                }
            }

            -- Eslint
            require 'eslint'.setup {}

            -- Typescript
            require 'typescript'.setup {}

            -- Prettier
            require 'prettier'.setup {}

            -- Copilot and nvim lua
            require 'coq_3p' {
                { src = 'nvimlua', short_name = 'nLUA' },
                { src = 'copilot', short_name = 'COP', accept_key = '<c-d>' }
            }

            -- Begin non config section

            -- Make errors pretty (when they're turned on)
            require('lsp_lines').setup()

            -- By default I don't really actually want them, cool though.
            vim.diagnostic.config({
                virtual_text = true,
                virtual_lines = false,
            })

            -- Start COQ
            vim.cmd(':COQnow -s')
        end,
    },
}
