return {
    'nvim-telescope/telescope.nvim',
    keys = {
        {
            '<leader>pe',
            function() require("telescope.builtin").find_files() end,
            desc = "File search"
        },
        {
            '<leader>pt',
            function() require("telescope.builtin").treesitter() end,
            desc = "Search treesitter symbols"
        },
        {
            '<leader>pf',
            function() require("telescope.builtin").current_buffer_fuzzy_find() end,
            desc = "Search current buffer"
        },
        {
            '<leader>ph',
            function() require("telescope.builtin").help_tags() end,
            desc = "Search for string globally"
        },
        {
            '<leader>ps',
            function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end,
            desc = "Search for string globally"
        },
        {
            '<leader>pv',
            ':Telescope file_browser path=%:p:h select_buffer=true<cr>',
            desc = "Open the telescope file browser"
        }
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'natecraddock/telescope-zf-native.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local file_browser = require("telescope").extensions.file_browser.actions

        telescope.setup({
            extensions = {
                ["zf-native"] = {
                    file = {
                        enable = true,
                        highlight_results = true,
                        match_filename = true,
                    },
                    generic = {
                        enable = true,
                        highlight_results = true,
                        match_filename = false,
                    }
                },
                file_browser = {
                    hidden = true,
                    respect_gitignore = false,
                    hijack_netrw = true,
                }
            },
            defaults = {
                layout_strategy = 'vertical',
                layout_config = {
                    vertical = { width = 0.9, height = 0.9 },
                    preview_cutoff = 0
                },
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<c-n>"] = file_browser.create,
                    }
                }
            }
        })

        -- This improves ordering of results when searching for files prioritizes filenames
        telescope.load_extension("zf-native")

        telescope.load_extension("file_browser")
    end,
}
