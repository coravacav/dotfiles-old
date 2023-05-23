require('keyset')
vim.g.mapleader = " "

-- remove the JHLK
Keyset('Remove j', "n", "j", "<nop>")
Keyset('Remove h', "n", "h", "<nop>")
Keyset('Remove l', "n", "l", "<nop>")
Keyset('Remove k', "n", "k", "<nop>")

-- replace the normal window movement keys
Keyset('Remove j window', "n", "<c-w>j", "<nop>")
Keyset('Remove h window', "n", "<c-w>h", "<nop>")
Keyset('Remove l window', "n", "<c-w>l", "<nop>")
Keyset('Remove k window', "n", "<c-w>k", "<nop>")
Keyset('Move to up window', "n", "<c-w><c-down>", "<c-w>j")
Keyset('Move to left window', "n", "<c-w><c-left>", "<c-w>h")
Keyset('Move to right window', "n", "<c-w><c-right>", "<c-w>l")
Keyset('Move to down window', "n", "<c-w><c-up>", "<c-w>k")
Keyset('Move to next window', "n", "<c-w><c-w>", "<c-w><c-w>")

-- replace the normal window resize keys
Keyset('Decrease vertical height', "n", Leader .. Window .. Decrease .. Height, "<c-w>-")
Keyset('Decrease horizontal width', "n", Leader .. Window .. Decrease .. Width, "<c-w><")
Keyset('Increase horizontal width', "n", Leader .. Window .. Increase .. Width, "<c-w>>")
Keyset('Increase vertical height', "n", Leader .. Window .. Increase .. Height, "<c-w>+")

-- line movement
Keyset('Move selected lines up', "v", "<a-up>", ":m '<-2<CR>gv=gv")
Keyset('Move selected lines down', "v", "<a-down>", ":m '>+1<CR>gv=gv")

-- append next line with a space (usually J) without cursor movement
Keyset('Append line without moving cursor', "n", "J", "mzJ`z")

-- make page up / page down only do half pages and center
Keyset('Page up', "i", "<pageup>", "<esc><c-u>zzi")
Keyset('Page down', "i", "<pagedown>", "<esc><c-d>zzi")
Keyset('Page up', "n", "<pageup>", "<c-u>zz")
Keyset('Page down', "n", "<pagedown>", "<c-d>zz")

-- remove default page up and page down
Keyset('Remove <c-u>', "n", "<c-u>", "<nop>")
Keyset('Remove <c-d>', "n", "<c-d>", "<nop>")

-- make search terms stay in the middle
Keyset('Next search result', "n", "n", "nzzzv")
Keyset('Previous search result', "n", "N", "Nzzzv")

-- <leader> p will now paste without copying
Keyset('Paste (no copy)', "x", "<leader>p", "\"_dP")

-- <leader> y will now copy to system clipboard as well
Keyset('Copy to system clipboard', { "n", "v" }, "<leader>y", "\"+y")
Keyset('Copy line to system clipboard', "n", "<leader>Y", "\"+Y")

-- <leader> d will now banish to the shadow realm
Keyset('Delete no copy', "n", "<leader>d", "\"_d")
Keyset('Delete no copy', "v", "<leader>d", "\"_d")

-- if ctrl c does not save vertical edit mode?
Keyset('Escape', "i", "<c-c>", "<esc>")

-- remove the godawful history menu?
Keyset('Remove history menu', "n", "Q", "<nop>")

-- ! do more research
-- quickfix navigation?
-- Keyset("n", "<c-k>)
-- Keyset
-- Keyset
-- Keyset?

-- <leader> s now replaces word under cursor
Keyset('Replace word', "n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Simpler redo
Keyset('Redo', 'n', 'U', '<c-r>')
Keyset('Delete redo', 'n', '<c-r>', '<nop>')

Keyset('Discard highlight search', 'n', Leader .. Unset .. 'h', "<cmd>:noh<cr>")

Keyset('Exit terminal with ESC', 't', '<esc>', '<c-\\><c-n>')
Keyset('Fast quit', 'n', Leader .. 'q', '<cmd>:close<cr>')
