-- I do this in lazy now, keeping around for reference
-- vim.g.loaded_netrw       = 1
-- vim.g.loaded_netrwPlugin = 1

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

success, err = pcall(require, "mappings")
if not success then
    vim.notify("Error loading mappings: " .. err, vim.log.levels.ERROR)
end
