-- Set editor options for a better experience
-- ------------------------------------------

-- Set the leader key
vim.g.mapleader = " "

-- Ensure we use a fat cursor even when we are in insert mode
vim.opt.guicursor = ""

-- Line numbers
vim.opt.nu = true                 -- Add line numbers
vim.opt.relativenumber = true     -- Use relative line numbers

-- Set indentation to use 2 spaces instead of tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Disable automatic wrap
vim.opt.wrap = false

-- Disable backups from Vim
-- Give Undotree plugin access to long running undos (different sessions)
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Disable highlights once a search is done
-- Highlight while we are performing the search though
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Allows us to use nice colors in Vim
vim.opt.termguicolors = true

vim.opt.scrolloff = 8               -- Always keep 8 lines before scroll
vim.opt.signcolumn = "yes"          -- Add sign column to the left of lines
vim.opt.isfname:append("@-@")       -- Characters for filenames a-Z & a-z

vim.opt.updatetime = 50             -- Ms until write to swap file when idle

vim.opt.colorcolumn = "80"          -- Add line at character 80

