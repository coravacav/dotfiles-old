local debug_flags = require 'debug_flags'

local M = {}

M.get = function(setting_key)
    local global_settings = vim.g[setting_key] or {}
    local buffer_settings = vim.b[setting_key] or {}

    local result = {}

    if global_settings then
        result = vim.tbl_extend('force', result, global_settings)
    end

    if buffer_settings then
        result = vim.tbl_extend('force', result, buffer_settings)
    end

    return result
end

M.override = function(opts, overrides)
    if overrides then
        opts = vim.tbl_extend('force', opts, overrides)
    end

    return opts
end

M.edit_global = function(variable)
    return function()
        vim.ui.input({
            default = variable.get_global_raw(),
            prompt = 'New value for ' .. variable.variable .. ' (global) : ',
        }, function(input)
            variable.set_global(input)
        end)
    end
end

M.edit_buffer = function(variable)
    return function()
        vim.ui.input({
            default = variable.get_buffer_raw(),
            prompt = 'New value for ' .. variable.variable .. ' (buffer) : ',
        }, function(input)
            variable.set_buffer(input)
        end)
    end
end

local try_parse = function(value)
    local success, result = pcall(loadstring, 'return ' .. value)

    if success and result then
        success, result = pcall(result)

        if success then
            return result
        end
    end

    vim.notify('Failed to parse value: ' .. value, vim.log.levels.ERROR)
    return nil
end


local create_setting = function(variable_key, setting_key, default_value)
    local setting = {}
    setting.key = setting_key
    setting.variable = variable_key
    setting.raw = setting_key .. '_raw'

    setting.get = function(base_config)
        local merged_config = base_config or {}
        local variable = M.get(setting_key)

        merged_config[variable_key] = variable

        return merged_config
    end

    setting.get_global_raw = function()
        return vim.g[setting.raw]
    end

    setting.get_buffer_raw = function()
        return vim.b[setting.raw]
    end

    setting.set_global = function(value)
        local parsed = try_parse(value)

        if parsed then
            vim.g[setting.raw] = value
            vim.g[setting_key] = parsed
            debug_flags.update_variable('Updated (global) ' .. setting.variable .. ' to ' .. value)
        end
    end

    setting.set_buffer = function(value)
        local parsed = try_parse(value)

        if parsed then
            vim.b[setting.raw] = value
            vim.b[setting_key] = parsed
            debug_flags.update_variable('Updated (buffer) ' .. setting.variable .. ' to ' .. value)
        end
    end

    if default_value then
        vim.g[setting.raw] = vim.inspect(default_value)
        vim.g[setting_key] = default_value
    end

    return setting
end

-- I'm pretty sure nobody else will use this for their variables
local prefix = 'conflict_fr33_'

M.telescope_file_ignore_patterns = create_setting('file_ignore_patterns', prefix .. 'fip', { '.git', 'node_modules' })

return M
