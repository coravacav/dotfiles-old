-- This file helps make keyboard bindings consistent

-- Set a kebinding globally
function Keyset(desc, modes, binding, action)
    vim.keymap.set(modes, binding, action, {
        desc = desc
    })
end

-- Set a keybinding in a buffer
function KeysetB(desc, modes, binding, action, buffer)
    vim.keymap.set(modes, binding, action, {
        buffer = buffer,
        desc = desc
    })
end

-- I export the following to make things consistent

-- entry point
Leader = '<leader>'

-- submenu 1
Toggle = 't'

-- category
LSP = 'l'
Format = 'f'
Project = 'p'
Goto = 'g'
Window = 'w'
Increase = 'i'
Decrease = 'd'

-- atom (text)
Symbol = 's'
Width = 'w'
Height = 'h'

-- atom (action)
Rename = 'r'
