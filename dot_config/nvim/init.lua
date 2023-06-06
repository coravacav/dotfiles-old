-- I do this in lazy now, keeping around for reference
-- vim.g.loaded_netrw       = 1
-- vim.g.loaded_netrwPlugin = 1

-- pcall so on the offchance anything fails, don't ruin everything else
pcall(require, "remap")
pcall(require, "lazy-init")
pcall(require, "set")
pcall(require, "project_settings_init")
pcall(require, "bindings")
