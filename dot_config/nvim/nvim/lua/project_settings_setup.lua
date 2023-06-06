local extended_variables = require 'extended_variables'

-- I don't know the way to get the "current directory" of a lua file.
local path = '~/.config/nvim/lua/project_settings'

local configs = {}

for file in vim.fs.dir(path) do
    configs[file] = require('project_settings.' .. string.sub(file, 0, string.len(file) - 4))
end

vim.notify(vim.fs.dirname('.'))

local augroup = vim.api.nvim_create_augroup("Project_Settings", {
    clear = true
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    group = augroup,
    pattern = { "*.c", "*.h" },
    callback = function()
        -- local dir = vim.b.
        --
        -- for name, config in pairs(configs) do
        --    if name == vim. then
        --
        --    end
        -- end
    end
})
