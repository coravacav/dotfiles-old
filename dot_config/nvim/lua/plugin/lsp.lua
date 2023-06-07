return {
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            -- Install lsp servers automatically
            {
                'williamboman/mason.nvim',
                build = ':MasonUpdate',
                dependencies = {
                    'WhoIsSethDaniel/mason-tool-installer.nvim',
                },
            },

            -- Make errors prettier
            { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },

            -- Add more lua help for neovim
            { 'folke/neodev.nvim', },

            -- Rust
            { 'simrat39/rust-tools.nvim' },

            -- Copilot
            { 'github/copilot.vim', },

            -- Typescript
            { 'jose-elias-alvarez/typescript.nvim' },

            -- Formatters
            {
                'jose-elias-alvarez/null-ls.nvim',
                dependencies = {
                    'nvim-lua/plenary.nvim'
                }
            },
        },
        config = function()
            local on_attach = require 'on_attach'

            -- neovim lua setup
            require('neodev').setup()

            local lsp = require 'lspconfig'
            local lsp_flags = {
                debounce_text_changes = 50,
            }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            -- This doesn't like actually work, so I use it below
            lsp.util.default_config = vim.tbl_extend('force', lsp.util.default_config or {}, {
                on_attach = on_attach,
                flags = lsp_flags,
                capabilities = capabilities,
            })

            -- This is all the servers mason will ensure are installed
            require('mason').setup()

            require('mason-tool-installer').setup {
                ensure_installed = {
                    'lua-language-server',
                    'taplo',
                    'typescript-language-server',
                    'eslint-lsp',
                    'eslint_d',
                    'rust-analyzer',
                    'css-lsp',
                    'tailwindcss-language-server',
                    'svelte-language-server',
                    'yaml-language-server',
                    'marksman',
                    'bash-language-server',
                    'json-lsp',
                    'html-lsp',
                    'prettier',
                },
                auto_update = false,
                run_on_start = true,
                start_delay = 3000,
                debounce_hours = 5,
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
                },
            })

            -- Rust
            require 'rust-tools'.setup {
                tools = {
                    inlay_hints = {
                        auto = false,
                    }
                },
            }

            -- Typescript
            require 'typescript'.setup {
                server = {
                    -- have to repass it
                    on_attach = on_attach,
                }
            }

            -- Setup linters
            local null_ls = require 'null-ls'

            null_ls.setup {
                sources = {
                    null_ls.builtins.formatting.prettier.with({
                        extra_filetypes = { "svelte" },
                        prefer_local = "node_modules/.bin",
                    }),
                    null_ls.builtins.formatting.eslint_d.with({
                        extra_filetypes = { "svelte" },
                        prefer_local = "node_modules/.bin",
                    }),
                    null_ls.builtins.diagnostics.eslint_d.with({
                        extra_filetypes = { "svelte" },
                        prefer_local = "node_modules/.bin",
                        -- condition = function(utils)
                        --     local check = utils.root_has_file({
                        --         ".eslintrc.js",
                        --         ".eslintrc.cjs",
                        --         ".eslintrc.yaml",
                        --         ".eslintrc.yml",
                        --         ".eslintrc.json",
                        --     })
                        --     return check
                        -- end,
                    }),
                    require('typescript.extensions.null-ls.code-actions'),
                },
                on_attach = on_attach,
                update_in_insert = true, -- Could have a performance implication
                debug = require 'debug_flags'.null_ls,
            }

            -- Make errors pretty (when they're turned on)
            require('lsp_lines').setup()

            -- By default I don't really actually want them, cool though.
            vim.diagnostic.config({
                virtual_text = false,
                virtual_lines = false,
            })
        end,
    },
}
