-- I do this in lazy now, keeping around for reference
-- vim.g.loaded_netrw       = 1
-- vim.g.loaded_netrwPlugin = 1

-- pcall so on the offchance anything fails, don't ruin everything else
local success, err
success, err = pcall(require, "remap")
if not success then
    vim.notify("Error loading remap: " .. err, vim.log.levels.ERROR)
end

success, err = pcall(require, "lazy-init")
if not success then
    vim.notify("Error loading lazy-init: " .. err, vim.log.levels.ERROR)
end

success, err = pcall(require, "set")
if not success then
    vim.notify("Error loading set: " .. err, vim.log.levels.ERROR)
end

success, err = pcall(require, "bindings")
if not success then
    vim.notify("Error loading bindings: " .. err, vim.log.levels.ERROR)
end

local onemap = require 'onemap'

onemap.register {
    ['<leader>mm'] = { function() end },
    ['<leader>'] = { p = { p = { '<cmd>:lua vim.notify("hi")<cr>', 'notify for fun' } } },
    ['<leader>p'] = {
        z = { '<cmd>:lua vim.notify("gamer")<cr>', 'notify for fun' },
        __lsp = {
            b = {
                '<cmd>:lua vim.notify("exclusivity")<cr>', 'notasdhf'
            }
        }
    },
}
