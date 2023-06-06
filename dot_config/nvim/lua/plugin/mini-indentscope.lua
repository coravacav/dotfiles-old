return {
    'echasnovski/mini.indentscope',
    event = "VeryLazy",
    config = function()
        require('mini.indentscope').setup({
            draw = {
                delay = 0,
                animation = require('mini.indentscope').gen_animation.none()
            }
        })
    end
}
