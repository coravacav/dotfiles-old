-- Rust
local rust_tools = require('rust-tools')

rust_tools.setup({
    server = {
        on_attach = function()
            vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end
    }
})
