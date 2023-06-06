local keys = require 'keys'

vim.g.mapleader = " "

-- remove the JHLK
keys.keyset('Remove j', "n", "j", "<nop>")
keys.keyset('Remove h', "n", "h", "<nop>")
keys.keyset('Remove l', "n", "l", "<nop>")
keys.keyset('Remove k', "n", "k", "<nop>")

-- replace the normal window movement keys
keys.keyset('Remove j window', "n", "<c-w>j", "<nop>")
keys.keyset('Remove h window', "n", "<c-w>h", "<nop>")
keys.keyset('Remove l window', "n", "<c-w>l", "<nop>")
keys.keyset('Remove k window', "n", "<c-w>k", "<nop>")
keys.keyset('Move to up window', "n", "<c-w><c-down>", "<c-w>j")
keys.keyset('Move to left window', "n", "<c-w><c-left>", "<c-w>h")
keys.keyset('Move to right window', "n", "<c-w><c-right>", "<c-w>l")
keys.keyset('Move to down window', "n", "<c-w><c-up>", "<c-w>k")
keys.keyset('Move to next window', "n", "<c-w><c-w>", "<c-w><c-w>")

-- replace the normal window resize keys
keys.keyset('Decrease vertical height', "n", keys.leader .. keys.window .. keys.decrease .. keys.height, "<c-w>-")
keys.keyset('Decrease horizontal width', "n", keys.leader .. keys.window .. keys.decrease .. keys.width, "<c-w><")
keys.keyset('Increase horizontal width', "n", keys.leader .. keys.window .. keys.increase .. keys.width, "<c-w>>")
keys.keyset('Increase vertical height', "n", keys.leader .. keys.window .. keys.increase .. keys.height, "<c-w>+")

-- replace the normal window movement keys
keys.keyset('Move window up', "n", keys.leader .. keys.window .. keys.movement .. '<up>', "<c-w>J")
keys.keyset('Move window left', "n", keys.leader .. keys.window .. keys.movement .. '<left>', "<c-w>H")
keys.keyset('Move window right', "n", keys.leader .. keys.window .. keys.movement .. '<right>', "<c-w>L")
keys.keyset('Move window down', "n", keys.leader .. keys.window .. keys.movement .. '<down>', "<c-w>K")

-- line movement
keys.keyset('Move selected lines up', "v", "<a-up>", ":m '<-2<CR>gv=gv")
keys.keyset('Move selected lines down', "v", "<a-down>", ":m '>+1<CR>gv=gv")

-- append next line with a space (usually J) without cursor movement
keys.keyset('Append line without moving cursor', "n", "J", "mzJ`z")

-- make page up / page down only do half pages and center
keys.keyset('Page up', "i", "<pageup>", "<esc><c-u>zzi")
keys.keyset('Page down', "i", "<pagedown>", "<esc><c-d>zzi")
keys.keyset('Page up', "n", "<pageup>", "<c-u>zz")
keys.keyset('Page down', "n", "<pagedown>", "<c-d>zz")

-- remove default page up and page down
keys.keyset('Remove <c-u>', "n", "<c-u>", "<nop>")
keys.keyset('Remove <c-d>', "n", "<c-d>", "<nop>")

-- make search terms stay in the middle
keys.keyset('Next search result', "n", "n", "nzzzv")
keys.keyset('Previous search result', "n", "N", "Nzzzv")

-- <leader> p will now paste without copying
keys.keyset('Paste (no copy)', "x", "<leader>p", "\"_dP")

-- <leader> y will now copy to system clipboard as well
keys.keyset('Copy to system clipboard', { "n", "v" }, "<leader>y", "\"+y")
keys.keyset('Copy line to system clipboard', "n", "<leader>Y", "\"+Y")

-- <leader> d will now banish to the shadow realm
keys.keyset('Delete no copy', "n", "<leader>d", "\"_d")
keys.keyset('Delete no copy', "v", "<leader>d", "\"_d")

-- if ctrl c does not save vertical edit mode?
keys.keyset('Escape', "i", "<c-c>", "<esc>")

-- remove the godawful history menu?
keys.keyset('Remove history menu', "n", "Q", "<nop>")

-- ! do more research
-- quickfix navigation?
-- keys.keyset("n", "<c-k>)
-- keys.keyset
-- keys.keyset
-- keys.keyset?

-- <leader> s now replaces word under cursor
keys.keyset('Replace word', "n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Simpler redo
keys.keyset('Redo', 'n', 'U', '<c-r>')
keys.keyset('Delete redo', 'n', '<c-r>', '<nop>')

keys.keyset('Discard highlight search', 'n', keys.leader .. keys.unset .. 'h', "<cmd>:noh<cr>")

keys.keyset('Exit terminal with ESC', 't', '<esc>', '<c-\\><c-n>')
keys.keyset('Fast close', 'n', keys.leader .. 'q', '<cmd>:close<cr>')
