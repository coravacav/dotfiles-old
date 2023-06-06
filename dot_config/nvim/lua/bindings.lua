local keys = require 'keys'
local wk = require 'which-key'
local ev = require 'extended_variables'

local telescope_opts = function(overrides)
    local opts = {}
    opts = ev.telescope_file_ignore_patterns.get(opts)
    opts = ev.override(opts, overrides)
    return opts
end

local harpoon_bindings = {
    name = "Harpoon",
    a = { function() require("harpoon.mark").add_file() end, "Mark current file" },
    e = { function() require("harpoon.ui").toggle_quick_menu() end, "See harpoon menu" },
    [keys.next] = { function() require("harpoon.ui").nav_next() end, "Go to next harpoon file" },
    [keys.previous] = { function() require("harpoon.ui").nav_prev() end, "Go to prev harpoon file" },
}

local function tb()
    return require("telescope.builtin")
end

local telescope_bindings = {
    name = "Telescope",
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
    name = "Vim",
    h = { '<cmd>Telescope notify<cr>', "Open the vim notify history" },
}

local tab_bindings = {
    name = "Tab",
    [keys.create] = { '<cmd>tabnew<cr>', "Create new tab" },
    [keys.next] = { '<cmd>tabnext<cr>', "Move to next tab" },
    [keys.previous] = { '<cmd>tabprevious<cr>', "Move to previous tab" },
    [keys.movement] = {
        name = "Move tab",
        [keys.left] = { '<cmd>tabmove -<cr>', "Move tab to the left" },
        [keys.right] = { '<cmd>tabmove +<cr>', "Move tab to the right" },
    },
}

local toggle_trouble_bindings = {
    name = 'Trouble',
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
    name = "Edit",
    [keys.global] = {
        name = "Edit global",
        [keys.telescope] = {
            name = "Telescope",
            [keys.ignore] = { ev.edit_global(ev.telescope_file_ignore_patterns), "Edit the global telescope ignore list" }
        }
    },
    [keys.buffer] = {
        name = "Edit buffer",
        [keys.telescope] = {
            name = "Telescope",
            [keys.ignore] = { ev.edit_buffer(ev.telescope_file_ignore_patterns), "Edit the buffer telescope ignore list" }
        }
    },
}
wk.register({
    [keys.harpoon] = harpoon_bindings,
    [keys.telescope] = telescope_bindings,
    [keys.vim] = vim_bindings,
    [keys.tab] = tab_bindings,
    [keys.toggle] = {
        name = "Toggle",
        ['\\'] = { '<cmd>ToggleTerm direction=float<cr>', 'Open floating terminal' },
        [keys.trouble] = toggle_trouble_bindings,
        u = { '<cmd>UndotreeToggle<cr>', "Toggle undotree" },
    },
    -- [keys.set] = {
    --     name = "Set",
    -- },
    -- [keys.unset] = {
    --     name = "Unset",
    -- },
    [keys.edit] = edit_bindings,
}, { prefix = keys.leader })

-- {
--     desc = "File search (incl hidden)",
--     Leader .. Project .. 'ne',
--     function()
--         require("telescope.builtin").find_files(telescope_opts {
--             hidden = true,
--             no_ignore = true,
--             no_ignore_parent = true
--         })
--     end,
-- },
