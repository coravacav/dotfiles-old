return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'natecraddock/telescope-zf-native.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        'stevearc/dressing.nvim',
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local file_browser = require("telescope").extensions.file_browser.actions
        local trouble = require("trouble.providers.telescope")

        telescope.setup {
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
                -- I do not always want all files
                hidden = true,

                -- Pretty
                winblend = 20,


                -- Seeing the preview on top is nice, since I don't really need to see all the results
                layout_strategy = 'flex',
                layout_config = {
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

                        -- Page keys to scroll preview
                        ["<pageup>"] = actions.preview_scrolling_up,
                        ["<pagedown>"] = actions.preview_scrolling_down,

                        -- Trouble mappings
                        ["<c-t>"] = trouble.open_with_trouble,
                    },
                    n = {
                        -- Trouble mappings
                        ["<c-t>"] = trouble.open_with_trouble,
                    }
                }
            }
        }

        -- This improves ordering of results when searching for files prioritizes filenames
        telescope.load_extension("zf-native")

        -- A mildly better extension (at least in my eyes) for file browsing.
        telescope.load_extension("file_browser")

        -- Dressing was alright, but lets just use a single plugin
        telescope.load_extension("ui-select")

        require 'dressing'.setup {
            input = {
                enabled = true,
                title_pos = 'center',
                insert_only = true,
                start_in_insert = true,
                relative = 'editor',
                mappings = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },

                    i = {
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                        ["<Up>"] = "HistoryPrev",
                        ["<Down>"] = "HistoryNext",
                    },
                },
            },
            select = { enabled = false }
        }
    end,
}
