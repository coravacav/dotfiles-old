local M = {}

M.leader = '<leader>'

M.toggle = 't'
M.definitions = 'd'
M.type_definitions = 't'
M.lsp = 'l'
M.format = 'f'
M.project = 'p'
M.goto = 'g'
M.window = 'w'
M.references = 'r'
M.workspace = 'w'
M.implementation = 'i'
M.close = 'q'
M.quit = 'q'
M.quickfixes = 'f'
M.buffer = 'b'
M.global = 'g'
M.movement = 'm'
M.create = 'c'
M.git = 'g'
M.symbol = 's'
M.width = 'w'
M.height = 'h'
M.rename = 'r'
M.up = '<up>'
M.down = '<down>'
M.left = '<left>'
M.right = '<right>'
M.next = 'n'
M.previous = 'p'
M.ignore = 'i'
M.last = 'l'
M.first = 'f'
M.increase = 'i'
M.decrease = 'd'
M.lsp_line = 'l'
M.edit_string = 's'
M.edit_list = 'l'

-- Plugin groups
M.harpoon = 'h'
M.telescope = 's'
M.vim = 'v'
M.trouble = 't'
M.tab = 't'
M.set = 's'
M.unset = 'n'
M.edit = 'e'

local debug_flags = require('debug_flags')

local function get_keyset_desc(desc, binding, modes)
    local formatted_modes = type(modes) == 'string' and modes or table.concat(modes, ', ')
    return desc .. '(' .. binding .. ') in ' .. formatted_modes
end

-- Set a kebinding globally
M.keyset = function(desc, modes, binding, action)
    debug_flags.keyset_global(get_keyset_desc(desc, binding, modes), 'info', {
        title = 'Keyset',
    })

    vim.keymap.set(modes, binding, action, {
        desc = desc
    })
end

-- Set a keybinding in a buffer
M.keysetB = function(desc, modes, binding, action, buffer)
    debug_flags.keyset_current_buffer(get_keyset_desc(desc, binding, modes), 'info', {
        title = 'KeysetB',
    })

    vim.keymap.set(modes, binding, action, {
        buffer = buffer,
        desc = desc
    })
end

-- Set a keybind for both setting and unsetting
M.keysetDumbSetter = function(desc, modes, binding, actionSet, actionUnset, buffer)
    M.keysetB(string.gsub(desc, '%s', 'Set'), modes, M.leader .. M.set .. binding, actionSet, buffer)
    M.keysetB(string.gsub(desc, '%s', 'Unset'), modes, M.leader .. M.unset .. binding, actionUnset, buffer)
end

return M
