return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')

      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required

    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'saadparwaiz1/cmp_luasnip'},
    {'rafamadriz/friendly-snippets'},
  },
  config = function()
      local lsp = require('lsp-zero').preset({})

      lsp.on_attach(function(client, bufnr)
          lsp.default_keymaps({buffer = bufnr})
      end)

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()


      -- You need to setup `cmp` after lsp-zero
      local cmp = require('cmp')

      local cmp_action = require('lsp-zero').cmp_action()

      cmp.setup({
          mapping = {

              -- `Enter` key to confirm completion
              ['<CR>'] = cmp.mapping.confirm({select = false}),

              -- Ctrl+Space to trigger completion menu
              ['<C-Space>'] = cmp.mapping.complete(),


              -- Navigate between snippet placeholder
              ['<C-f>'] = cmp_action.luasnip_jump_forward(),
              ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          },
          sources = {
              {name = 'path'},
              {name = 'nvim_lsp'},
              {name = 'buffer', keyword_length = 3},
              {name = 'luasnip', keyword_length = 2},
          },
      })
  end
}
