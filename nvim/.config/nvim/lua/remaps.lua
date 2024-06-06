-- Trigger project view (netrw)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Trigger source config file
vim.keymap.set("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")

-- Back to NORMAL from INSERT
vim.keymap.set("i", "jk", "<ESC>")

-- Move visual selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Add next line at the end of current while keeping cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Offset half page but leave cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-U>zz")

-- Keep search terms centered in the viewport
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Replace selection by pasting without yanking the text deleted
vim.keymap.set("x", "<leader>p", '"_dp')

-- Copy into system's clipboard
vim.keymap.set("n", "<leader>y", '"+y')    -- await for motion
vim.keymap.set("v", "<leader>y", '"+y')    -- selected content
vim.keymap.set("n", "<leader>Y", '"+Y')    -- current line
vim.keymap.set("n", "<leader>F", 'gg"+yG') -- file's content

-- Delete content without yanking it
vim.keymap.set("n", "<leader>d", '"_d') -- await for motion
vim.keymap.set("v", "<leader>d", '"_d') -- selected content

-- Map Ctrl+c to ESC because although they behave mostly the same, they
-- behave differently
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable key to repeat last recorded register
vim.keymap.set("n", "Q", "<nop>")

-- Change project using Tmux (Go back 2 previous with Tmux's keys: 'Ctrl+a L')
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format document using LSP
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

-- Navigate the elements of a Quickfix list & center cursor
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Navigate the elements of a Quickfix list (local to window) & center cursor
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace the current selected word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Give the current file executable permissions
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
