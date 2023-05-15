vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Currently using telescope-file-browser

-- remove the JHLK 
vim.keymap.set("n", "j", "<nop>") -- down
vim.keymap.set("n", "h", "<nop>") -- left
vim.keymap.set("n", "l", "<nop>") -- right
vim.keymap.set("n", "k", "<nop>") -- up
vim.keymap.set("n", "<c-w>j", "<nop>")
vim.keymap.set("n", "<c-w>h", "<nop>")
vim.keymap.set("n", "<c-w>l", "<nop>")
vim.keymap.set("n", "<c-w>k", "<nop>")

-- replace the normal window movement keys
vim.keymap.set("n", "<c-w><c-down>", "<c-w>j")
vim.keymap.set("n", "<c-w><c-left>", "<c-w>h") 
vim.keymap.set("n", "<c-w><c-right>", "<c-w>l")
vim.keymap.set("n", "<c-w><c-up>", "<c-w>k")
-- ! not including rotational 
-- c-w c-w is how you cycle through all

--- line movement
vim.keymap.set("v", "<a-up>",   ":m '<-2<CR>gv=gv") -- restores alt up
vim.keymap.set("v", "<a-down>", ":m '>+1<CR>gv=gv") -- restores alt down

-- append next line with a space (usually J) without cursor movement
vim.keymap.set("n", "J", "mzJ`z")

-- make page up / page down only do half pages and center
vim.keymap.set("i", "<pageup>", "<esc><c-u>zzi")
vim.keymap.set("i", "<pagedown>", "<esc><c-d>zzi")
vim.keymap.set("n", "<pageup>", "<c-u>zz")
vim.keymap.set("n", "<pagedown>", "<c-d>zz")

-- remove default page up and page down for tmux space
vim.keymap.set("n", "<c-u>", "<nop>")
vim.keymap.set("n", "<c-d>", "<nop>")

-- make search terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- <leader> p will now paste without copying 
vim.keymap.set("x", "<leader>p", "\"_dP")

-- <leader> y will now copy to system clipboard as well
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- <leader> d will now banish to the shadow realm
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- if ctrl c does not save vertical edit mode?
vim.keymap.set("i", "<c-c>", "<esc>")

-- remove the godawful history menu?
vim.keymap.set("n", "Q", "<nop>")

-- ! do more research
-- quickfix navigation?
-- vim.keymap.set("n", "<c-k>)
-- vim.keymap.set
-- vim.keymap.set
-- vim.keymap.set?

-- <leader> s now replaces the word!
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
