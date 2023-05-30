require 'keyset'

return {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    keys = {
        {
            desc = 'Close trouble',
            Leader .. Close .. Trouble,
            '<cmd>:TroubleClose<cr>'
        },
        {
            desc = 'Toggle trouble buffer diagnostics',
            Leader .. Toggle .. Trouble .. Buffer,
            '<cmd>:TroubleToggle document_diagnostics<cr>'
        },
        {
            desc = 'Toggle trouble workspace diagnostics',
            Leader .. Toggle .. Trouble .. Workspace,
            '<cmd>:TroubleToggle workspace_diagnostics<cr>'
        },
        {
            desc = 'Toggle trouble LSP references',
            Leader .. Toggle .. Trouble .. 'r',
            '<cmd>:TroubleToggle lsp_references<cr>'
        },
        {
            desc = 'Toggle trouble LSP definitions',
            Leader .. Toggle .. Trouble .. 'd',
            '<cmd>:TroubleToggle lsp_definitions<cr>'
        },
        {
            desc = 'Toggle trouble LSP type definitions',
            Leader .. Toggle .. Trouble .. 't',
            '<cmd>:TroubleToggle lsp_type_definitions<cr>'
        },
        {
            desc = 'Toggle trouble quickfixes',
            Leader .. Toggle .. Trouble .. 'q',
            '<cmd>:TroubleToggle quickfix<cr>'
        },
        {
            desc = 'Toggle trouble location list',
            Leader .. Toggle .. Trouble .. 'l',
            '<cmd>:TroubleToggle loclist<cr>'
        },
        {
            desc = 'Go to next trouble item, skipping the groups',
            Leader .. LSP .. Trouble .. Next,
            function()
                require("trouble").next({ skip_groups = true, jump = true })
            end
        },
        {
            desc = 'Go to previous trouble item, skipping the groups',
            Leader .. LSP .. Trouble .. Previous,
            function()
                require("trouble").previous({ skip_groups = true, jump = true })
            end
        },
        {
            desc = 'Go to last trouble item, skipping the groups',
            Leader .. LSP .. Trouble .. Last,
            function()
                require("trouble").first({ skip_groups = true, jump = true })
            end
        },
        {
            desc = 'Go to first trouble item, skipping the groups',
            Leader .. LSP .. Trouble .. First,
            function()
                require("trouble").last({ skip_groups = true, jump = true })
            end
        },


    },
    opts = {},
}
