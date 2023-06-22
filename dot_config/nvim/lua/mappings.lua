local keys = require 'keys'
local wk = require 'which-key'
local onemap = require 'onemap'
local ev = require 'extended_variables'

local telescope_opts = function(overrides)
    local opts = {
        hidden = true
    }
    opts = ev.telescope_file_ignore_patterns.get(opts)
    opts = ev.override(opts, overrides)
    return opts
end

local harpoon_bindings = {
    extra_wk_name = "Harpoon",
    a = { function() require("harpoon.mark").add_file() end, "Mark current file" },
    e = { function() require("harpoon.ui").toggle_quick_menu() end, "See harpoon menu" },
    [keys.next] = { function() require("harpoon.ui").nav_next() end, "Go to next harpoon file" },
    [keys.previous] = { function() require("harpoon.ui").nav_prev() end, "Go to prev harpoon file" },
}

local oil_bindings = {
    extra_wk_name = "Oil",
    o = { function() require("oil").toggle_float() end, "Open oil" },
}

local function tb()
    return require("telescope.builtin")
end

local telescope_bindings = {
    extra_wk_name = "Telescope",
    ne = { function() tb().find_files(telescope_opts {
        hidden = true,
        no_ignore = true,
        no_ignore_parent = true
    }) end, "File browser, no ignore" },
    e = { function() tb().find_files(telescope_opts()) end, "File search" },
    r = { function() tb().registers(telescope_opts()) end, "Register search" },
    t = { function() tb().treesitter(telescope_opts()) end, "Search treesitter symbols" },
    f = { function() tb().current_buffer_fuzzy_find(telescope_opts()) end, "Search current buffer" },
    p = { function() tb().commands(telescope_opts()) end, "Vim command palette" },
    h = { function() tb().help_tags(telescope_opts()) end, "Search help tags" },
    s = { function() tb().live_grep(telescope_opts()) end, "Search for string globally" },
    [keys.git] = { function() tb().git_status(telescope_opts()) end, "See all current git changes" },
    v = { '<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>', "Open the telescope file browser" },
    u = { function() tb().resume() end, "Resume the last telescope search", }
}

local vim_bindings = {
    extra_wk_name = "Vim",
    h = { '<cmd>Telescope notify<cr>', "Open the vim notify history" },
}

local tab_bindings = {
    extra_wk_name = "Tab",
    [keys.create] = { '<cmd>tabnew<cr>', "Create new tab" },
    [keys.next] = { '<cmd>tabnext<cr>', "Move to next tab" },
    [keys.previous] = { '<cmd>tabprevious<cr>', "Move to previous tab" },
    [keys.movement] = {
        extra_wk_name = "Move tab",
        [keys.left] = { '<cmd>tabmove -<cr>', "Move tab to the left" },
        [keys.right] = { '<cmd>tabmove +<cr>', "Move tab to the right" },
    },
}

local toggle_trouble_bindings = {
    extra_wk_name = 'Trouble',
    [keys.close] = { '<cmd>TroubleClose<cr>', 'Close trouble' },
    [keys.buffer] = { '<cmd>TroubleToggle document_diagnostics<cr>', 'Toggle trouble buffer diagnostics' },
    [keys.workspace] = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'Toggle trouble workspace diagnostics' },
    [keys.references] = { '<cmd>TroubleToggle lsp_references<cr>', 'Toggle trouble LSP references' },
    [keys.definitions] = { '<cmd>TroubleToggle lsp_definitions<cr>', 'Toggle trouble LSP definitions' },
    [keys.type_definitions] = { '<cmd>TroubleToggle lsp_type_definitions<cr>', 'Toggle trouble LSP type definitions' },
    [keys.quickfixes] = { '<cmd>TroubleToggle quickfix<cr>', 'Toggle trouble quickfixes' },
    l = { '<cmd>TroubleToggle loclist<cr>', 'Toggle trouble loclist' },
    -- These should not be in "toggle"
    -- [keys.next] = {
    --     function()
    --         require("trouble").next({ skip_groups = true, jump = true })
    --     end, 'Go to next trouble item, skipping the groups' },
    -- [keys.previous] = {
    --     function()
    --         require("trouble").previous({ skip_groups = true, jump = true })
    --     end, 'Go to previous trouble item, skipping the groups' },
    -- [keys.first] = {
    --     function()
    --         require("trouble").first({ skip_groups = true, jump = true })
    --     end, 'Go to first trouble item, skipping the groups' },
    -- [keys.last] = {
    --     function()
    --         require("trouble").last({ skip_groups = true, jump = true })
    --     end, 'Go to last trouble item, skipping the groups' },
}

local edit_bindings = {
    extra_wk_name = "Edit",
    [keys.global] = {
        extra_wk_name = "Edit global",
        [keys.telescope] = {
            extra_wk_name = "Telescope",
            [keys.ignore] = { ev.edit_global(ev.telescope_file_ignore_patterns), "Edit the global telescope ignore list" }
        }
    },
    [keys.buffer] = {
        extra_wk_name = "Edit buffer",
        [keys.telescope] = {
            extra_wk_name = "Telescope",
            [keys.ignore] = { ev.edit_buffer(ev.telescope_file_ignore_patterns), "Edit the buffer telescope ignore list" }
        }
    },
}

local lsp_bindings = {
    extra_wk_name = "LSP",
    a = { function()
            vim.lsp.buf.code_action()
        end, "Open code actions"},
}

local goto_bindings = {
    extra_wk_name = "Goto",
    [keys.symbol] = {
        extra_wk_name = "Goto symbol",
        [keys.definitions] = { function()
            require('telescope.builtin').lsp_definitions()
        end, "Goto symbol definition"},
        [keys.type_definitions] = { function()
            require('telescope.builtin').lsp_type_definitions()
        end, "Goto symbol type definition"},
        [keys.references] = { function()
            require('telescope.builtin').lsp_references()
        end, "Goto symbol references"},
        [keys.implementation] = { function()
            require('telescope.builtin').lsp_implementations()
        end, "Goto symbol implementation"},
    },
    [keys.buffer] = {
        extra_wk_name = "Goto document (buffer)",
        [keys.symbol] = { function()
            require('telescope.builtin').lsp_document_symbols()
        end, "Goto document (buffer) symbols"},
    },
    [keys.workspace] = {
        extra_wk_name = "Goto workspace",
        [keys.symbol] = { function()
            require('telescope.builtin').lsp_workspace_symbols()
            -- Possibly want require('telescope.builtin').lsp_dynamic_workspace_symbols()
        end, "Goto workspace symbols"},
    }
}

local format_bindings = {
    extra_wk_name = "Format",
    a = {
        function()
            vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end, "Format buffer"
    }
}

local lsp_toggle_bindings = {
    extra_wk_name = "Toggle",
    [keys.lsp] = {
        extra_wk_name = "Toggle LSP",
        v = {
            function()
                vim.diagnostic.config({
                    virtual_text = not vim.diagnostic.config().virtual_text,
                })
            end, "Toggle virtual_text"
        },
        [keys.lsp_line] = {
            function()
                vim.diagnostic.config({
                    virtual_lines = not vim.diagnostic.config().virtual_lines,
                })
            end, "Toggle lsp_line"
        }
    }
}

local toggle_bindings = {
        extra_wk_name = "Toggle",
        ['\\'] = { '<cmd>ToggleTerm direction=float<cr>', 'Open floating terminal' },
        [keys.trouble] = toggle_trouble_bindings,
        u = { '<cmd>UndotreeToggle<cr>', "Toggle undotree" },
        __lsp = lsp_toggle_bindings,
}

local set_bindings = {
    [keys.lsp] = {
        extra_wk_name = "LSP",
        [keys.lsp_line] = {
            function()
                vim.diagnostic.config({
                    virtual_lines = true,
                })
            end, "Set LSP line diagnostics"
        }

    }
}

local unset_bindings = {
    extra_wk_name = "Unset",
    [keys.lsp] = {
        extra_wk_name = "LSP",
        [keys.lsp_line] = {
            function()
                vim.diagnostic.config({
                    virtual_lines = false,
                })
            end, "Unset LSP line diagnostics"
        }
    }
}

onemap.register({
    [keys.harpoon] = harpoon_bindings,
    [keys.telescope] = telescope_bindings,
    [keys.vim] = vim_bindings,
    [keys.tab] = tab_bindings,
    [keys.toggle] = toggle_bindings,
    [keys.edit] = edit_bindings,
    o = oil_bindings,
    __lsp = {
            [keys.lsp] = lsp_bindings,
            [keys.goto] = goto_bindings,
            [keys.format] = format_bindings,
            [keys.set] = set_bindings,
            [keys.unset] = unset_bindings,
    }
}, {
    prefix = keys.leader,
})
