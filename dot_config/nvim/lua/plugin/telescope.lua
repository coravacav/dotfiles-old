require 'keyset'

-- I don't want this all the time, it's useful _sometimes_
-- Mainly when you actually want extra context
-- Vertical Layout Config
local vlc = { width = 0.9, height = 0.9 }

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
            function() require("telescope.builtin").find_files(vlc) end,
        },
        {
            desc = "Search treesitter symbols",
            Leader .. Project .. 't',
            function() require("telescope.builtin").treesitter() end,
        },
        {
            desc = "Search current buffer",
            Leader .. Project .. 'f',
            function() require("telescope.builtin").current_buffer_fuzzy_find(vlc) end,
        },
        {
            desc = "Vim command palette",
            Leader .. Project .. 'p',
            function() require("telescope.builtin").commands() end,
        },
        {
            desc = "Search help tags",
            Leader .. Project .. 'h',
            function() require("telescope.builtin").help_tags(vlc) end,
        },
        {
            desc = "Search for string globally",
            Leader .. Project .. 's',
            function()
                vim.ui.input({ prompt = "Search globally > " }, function(input)
                    require("telescope.builtin").grep_string({ search = input })
                end)
            end,
        },
        {
            desc = "See all current git changes",
            Leader .. Project .. Git .. 'c',
            function()
                require("telescope.builtin").git_status()
            end,
        },
        {
            desc = "Open the telescope file browser",
            Leader .. Project .. 'v',
            '<cmd>:Telescope file_browser path=%:p:h select_buffer=true<cr>',
        },
        {
            desc = "Open the vim notify history",
            Leader .. Vim .. 'h',
            '<cmd>:Telescope notify<cr>',
        }
    },
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
    event = 'VeryLazy',
}
