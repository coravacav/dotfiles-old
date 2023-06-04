-- This file helps make keyboard bindings consistent
-- entry point
Leader = '<leader>'
Leader_Default = '<leader>d'

-- category
Toggle = 't'
Set = 's'
Unset = 'n'
LSP = 'l'
Format = 'f'
Project = 'p'
Goto = 'g'
Window = 'w'
Workspace = 'w'
Close = 'c'
Trouble = 't'
Buffer = 'b'
Move = 'm'
Tab = 't'
Create = 'c'
Git = 'g'
Vim = 'v'

-- atom (text)
Symbol = 's'
Width = 'w'
Height = 'h'

-- atom (action)
Rename = 'r'

Up = '<up>'
Down = '<down>'
Left = '<left>'
Right = '<right>'
Next = 'n'
Previous = 'p'
Last = 'l'
First = 'f'
Increase = 'i'
Decrease = 'd'

local debug_flags = require('debug_flags')

local function get_keyset_desc(desc, binding, modes)
    local formatted_modes = type(modes) == 'string' and modes or table.concat(modes, ', ')
    return desc .. '(' .. binding .. ') in ' .. formatted_modes
end

-- Set a kebinding globally
function Keyset(desc, modes, binding, action)
    debug_flags.keyset_global(get_keyset_desc(desc, binding, modes), 'info', {
        title = 'Keyset',
    })

    vim.keymap.set(modes, binding, action, {
        desc = desc
    })
end

-- Set a keybinding in a buffer
function KeysetB(desc, modes, binding, action, buffer)
    debug_flags.keyset_current_buffer(get_keyset_desc(desc, binding, modes), 'info', {
        title = 'KeysetB',
    })

    vim.keymap.set(modes, binding, action, {
        buffer = buffer,
        desc = desc
    })
end

-- Set a keybind for both setting and unsetting
function KeysetDumbSetter(desc, modes, binding, actionSet, actionUnset, buffer)
    KeysetB(string.gsub(desc, '%s', 'Set'), modes, Leader .. Set .. binding, actionSet, buffer)
    KeysetB(string.gsub(desc, '%s', 'Unset'), modes, Leader .. Unset .. binding, actionUnset, buffer)
end
