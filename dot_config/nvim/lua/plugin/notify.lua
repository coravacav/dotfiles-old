return {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    config = function()
        local notify = require('notify')

        notify.setup {
            fps = 1,
            render = "compact",
            stages = "static",
            timeout = 5000,
        }

        vim.notify = notify
        require('telescope').load_extension('notify')
    end,
}
