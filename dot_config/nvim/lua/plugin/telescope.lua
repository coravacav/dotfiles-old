require('keyset')

return {
    'nvim-telescope/telescope.nvim',
    keys = {
        {
            desc = "Register search",
            Leader .. Project .. 'r',
            function() require("telescope.builtin").registers() end,
        },
        {
            desc = "File search",
            Leader .. Project .. 'e',
            function() require("telescope.builtin").find_files() end,
        },
        {
            desc = "Search treesitter symbols",
            Leader .. Project .. 't',
            function() require("telescope.builtin").treesitter() end,
        },
        {
            desc = "Search current buffer",
            Leader .. Project .. 'f',
            function() require("telescope.builtin").current_buffer_fuzzy_find() end,
        },
        {
            desc = "Vim command palette",
            Leader .. Project .. 'p',
            function() require("telescope.builtin").commands() end,
        },
        {
            desc = "Search for string globally",
            Leader .. Project .. 'h',
            function() require("telescope.builtin").help_tags() end,
        },
        {
            desc = "Search for string globally",
            Leader .. Project .. 's',
            function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end,
        },
        {
            desc = "Open the telescope file browser",
            Leader .. Project .. 'v',
            ':Telescope file_browser path=%:p:h select_buffer=true<cr>',
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
                        -- I installed this for a reason
                        enable = true,

                        -- Ooh, shiny
                        highlight_results = true,

                        -- Crazy enough, while searching for files, considering the filename is useful.
                        match_filename = true,
                    },
                    generic = {
                        -- It's good in general, or at least not worse.
                        enable = true,

                        -- Ooh, shiny part 2
                        highlight_results = true,

                        -- Don't particularly care if I'm not searching for a file
                        match_filename = false,
                    }
                },
                file_browser = {
                    -- Nothing shall hide.
                    hidden = true,

                    -- I don't want to respect the .gitignore, browing files means see all
                    respect_gitignore = false,

                    -- honestly I don't think this works but I'd want it anyway
                    hijack_netrw = true,
                }
            },
            defaults = {
                -- Seeing the preview on top is nice, since I don't really need to see all the results
                layout_strategy = 'vertical',
                layout_config = {
                    -- I have a screen, might as well use most of it
                    vertical = { width = 0.9, height = 0.9 },

                    -- show a preview no matter what
                    preview_cutoff = 0
                },
                mappings = {
                    i = {
                        -- because this isn't bound by default for some reason
                        ["<esc>"] = actions.close,

                        -- I want to be able to create a file like I normally would
                        ["<c-n>"] = file_browser.create,

                        -- r sounds rename-y
                        ["<c-r>"] = file_browser.rename,
                    }
                }
            }
        })

        -- This improves ordering of results when searching for files prioritizes filenames
        telescope.load_extension("zf-native")

        -- A mildly better extension (at least in my eyes) for file browsing.
        telescope.load_extension("file_browser")
    end,
}
